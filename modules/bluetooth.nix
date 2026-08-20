{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "bluetooth-connect-last" ''
      device_info=$(bluetoothctl devices | tail -1)
      if [ -z "$device_info" ]; then
        notify-send -u warning "Bluetooth" "No paired Bluetooth devices found." -i network-bluetooth
        exit 1
      fi

      mac=$(echo "$device_info" | awk '{print $2}')
      name=$(echo "$device_info" | cut -d' ' -f3-)
      if [ -z "$name" ]; then
        name="$mac"
      fi

      if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
        notify-send -u low "Bluetooth" "Already connected to $name" -i network-bluetooth
        exit 0
      fi

      notify-send -u normal "Bluetooth" "Connecting to $name..." -i network-bluetooth

      if bluetoothctl connect "$mac"; then
        notify-send -u normal "Bluetooth" "Connected to $name" -i network-bluetooth
      else
        notify-send -u critical "Bluetooth" "Failed to connect to $name" -i network-bluetooth
      fi
    '')
  ];
}

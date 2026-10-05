# pyright: reportWildcardImportFromLibrary=false
# pyright: reportReturnType=false
# ruff: noqa: F401, I001, UP029, RUF100


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

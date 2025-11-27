package org.eda.practicareda13;

public class BinaryTreeNode<T> {
	T data;
	BinaryTreeNode<T> left,right;
	
	public BinaryTreeNode(T pData, BinaryTreeNode<T> pLeft, BinaryTreeNode<T> pRight){
		this.data=pData;
		this.left=pLeft;
		this.right=pRight;
	}
}

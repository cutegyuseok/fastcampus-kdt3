package me.ioc.operator;

public class CalAdd implements Operator {
	@Override
	public int operator(int x, int y) {
		return x + y;
	}
}

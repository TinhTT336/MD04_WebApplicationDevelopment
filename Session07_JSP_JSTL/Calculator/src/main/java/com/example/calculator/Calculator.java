package com.example.calculator;

public class Calculator {

    public double calculate(double first, double second, Character operator) throws Exception {
        double result = 0;

        switch (operator) {
            case '+':
                result = first + second;
                break;
            case '-':
                result = first - second;
                break;
            case '/':
              if(second!=0){
                  result = first / second;
              }else{
                  throw new Exception("Toan tu khong hop le!");
              }
                break;
            case '*':
                result = first * second;
                break;
            default:
                throw new Exception("Toán tử không hợp lệ!");
        }
        return result;
    }
}

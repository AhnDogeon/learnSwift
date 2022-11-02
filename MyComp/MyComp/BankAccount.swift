//
//  BankAccount.swift
//  MyComp
//
//  Created by 뚱건 on 2022/11/01.
//
// 같은 프로젝트에서 접근
public class BankAccount {
    private var id:Int
    private var name:String
    private var balance:Int
    public init() {
        id = 0
        name = ""
        balance = 0
    }
    public init(id:Int, name:String, amount:Int)
    {
        self.id = id
        self.name = name
        self.balance = amount
    }
    public func deposit(amount:Int)
    {
        self.balance += amount
    }
    public func withdraw(amount:Int)
    {
        self.balance -= amount
    }
    public var ID:Int {
        get { return id }
        set { id = newValue }
    }
    public var Name: String {
        get { return name }
        
    }
    public var Balance:Int {
        get { return balance }
    }
}

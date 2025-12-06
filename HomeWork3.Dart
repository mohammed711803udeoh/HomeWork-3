class BankAccount{
  int accountNumber;
  String accountName;
    double balance;
  BankAccount(this.accountNumber,this.accountName,this.balance);
  getBalance(){
    return balance;
  }
  printAccountinfo(){
    print("Account Number: $accountNumber");
    print("Account Name: $accountName");
    print("Account Balance: $balance"); 
  }

}
class SavingAccount extends BankAccount{
  static double _intersRate = 0.12;
  SavingAccount(
    super.accountNumber,
    super.accountName ,
  super.balance );
  getIntrest(){
    return _intersRate * balance;
  }
  printSavingInfo () {
    printAccountinfo();
    print("interest rate: $_intersRate");
  }
}
class CheckingAccount extends BankAccount
{
  double amount;
  CheckingAccount(super.accountNumber,super.accountName,super.balance,this.amount);
  deposit(double amount){
    balance += amount;
  }
  withdraw(double amount){
    balance -= amount;
  }
  printCheckingInfo(){
    printAccountinfo();
    print("Amount : $amount");
  }
}
  
void main(){
BankAccount ba = BankAccount (12345,"John Doe",1000.0);
ba.printAccountinfo();
print("------------------------------");
SavingAccount sa = SavingAccount (23456,"Jane Smith",2000.0);
sa.printSavingInfo();
print("Interest Earned: ${sa.getIntrest()}");
print("------------------------------");
CheckingAccount ca = CheckingAccount (34567,"Bob Johnson",1500.0,500.0);
ca.printCheckingInfo();

}
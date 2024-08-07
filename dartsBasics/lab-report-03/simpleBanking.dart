import 'dart:io';

void main()
{
  bankAccount obj = bankAccount(018, "Riaz", 50000);
  bankAccount obj2 = bankAccount(015, "Hassan", 780000);
  bankAccount obj3 = bankAccount(020, "Munazza", 67000);
interface(obj);
}
class bankAccount{

  int accountNo;
  String accountHolderName;
  int balance;

  bankAccount (this.accountNo, this.accountHolderName, this.balance );

  void withdrawMoney(int amount)
  {
    if(amount <= balance)
    {
      balance -= amount;
    }
    else{
      print("Insufficient Funds in the Account");
    }
  }
  void depositMoney(int amount)
  {
    balance += amount;
  }

  void checkBalance()
  {
    print("Account Balance is : $balance");
  }
}
void interface(bankAccount account)
  {
  print("Hey!  ${account.accountHolderName}  Your account number is  ${account.accountNo}");
  print("Enter any option :");
  print("1 : DepositFunds");
  print("2 : withDraFunds");
  print("3 : balanceInQuiry");
  int option = int.parse(stdin.readLineSync()!);

  switch (option) {
    case 1:
    stdout.write("Enter Amount to Deposit : ");
    int amount = int.parse(stdin.readLineSync()!); 
    account.depositMoney(amount);
    print("Amount Deposit successfully!");
    print("Your new balance is : ${account.balance}"); 
      break;
    case 2:
 stdout.write("Enter Amount to Withdraw : ");
    int amount = int.parse(stdin.readLineSync()!); 
    account.withdrawMoney(amount);
    print("Amount Withdraw successfully!");
    print("Your new balance is : ${account.balance}"); 
      break;
      case 3:
      account.checkBalance();
    default:
    print("invalid choice . Plz try again");
  }
  }
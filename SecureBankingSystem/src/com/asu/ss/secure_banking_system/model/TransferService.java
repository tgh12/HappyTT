package com.asu.ss.secure_banking_system.model;



import java.util.Date;




import org.hibernate.Session;
import org.hibernate.Transaction;



enum TypeOfTransfer {
	CREDIT,DEBIT,TRANSFER
}
public class TransferService {

	private String fromAccount;
	private String toAccount;
	private String account;
	private TypeOfTransfer typeOfTrans;
	private double tranAmt;
	private String userID;
	/**
	 * @return the fromAccount
	 */
	public String getFromAccount() {
		return fromAccount;
	}
	/**
	 * @param fromAccount the fromAccount to set
	 */
	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}
	/**
	 * @return the toAccount
	 */
	public String getToAccount() {
		return toAccount;
	}
	/**
	 * @param toAccount the toAccount to set
	 */
	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}
	/**
	 * @return the account
	 */
	public String getAccount() {
		return account;
	}
	/**
	 * @param account the account to set
	 */
	public void setAccount(String account) {
		this.account = account;
	}
	/**
	 * @return the typeOfTrans
	 */
	public TypeOfTransfer getTypeOfTrans() {
		return typeOfTrans;
	}
	/**
	 * @param typeOfTrans the typeOfTrans to set
	 */
	public void setTypeOfTrans(TypeOfTransfer typeOfTrans) {
		this.typeOfTrans = typeOfTrans;
	}
	/**
	 * @return the tranAmt
	 */
	public double getTranAmt() {
		return tranAmt;
	}
	/**
	 * @param tranAmt the tranAmt to set
	 */
	public void setTranAmt(double tranAmt) {
		this.tranAmt = tranAmt;
	}
	/**
	 * @return the userID
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	/* This constructor to be used when transfer between two accounts is involved*/
	public TransferService(String fromAccount, String toAccount,
			TypeOfTransfer typeOfTrans, double tranAmt, String userID) {
		
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
		this.typeOfTrans = typeOfTrans;
		this.tranAmt = tranAmt;
		this.userID = userID;
	}
	/*This Constructor to be used only when a Debit/Credit to be made */
	public TransferService(String fromOrToAccount, TypeOfTransfer typeOfTrans, double tranAmt, String userID)
	{
		this.account = fromOrToAccount;
		this.typeOfTrans = typeOfTrans;
		this.tranAmt = tranAmt;
		this.userID = userID;
	}
	public void DebitOrCreditAccount(){
		AccountService accountService = new AccountService();
		
		AccountEntity accEntity;
		TransactionKey transactionKey = new TransactionKey();
		TransactionEntity transaction = new TransactionEntity();
		
		Transaction tx = null;
		Session session = SessionFactoryUtil.getSessionFactory().openSession();
		char typeOfTransfer;
		if(typeOfTrans == TypeOfTransfer.CREDIT)
			typeOfTransfer = 'C';
		else
			typeOfTransfer = 'D';
		
		try {
		
			tx = session.beginTransaction();
			transactionKey.setTransactionID(1);
			
			transactionKey.setTranType(typeOfTransfer);
		
			transaction.setAccountId(account);
			transaction.setTranAmount(tranAmt);
			transaction.setTranDate(new Date());
			transaction.setTransactionKey(transactionKey);
			transaction.setUserID(accountService.getAccountDetails(account).getUserID());
			transaction.setTranCreatedByUser(userID);
			
			session.save(transaction);
			
			accEntity = accountService.updateBalance(account,tranAmt, typeOfTransfer);
			
			session.update(accEntity);
			
			tx.commit();
		}
		catch(Exception e)
		{
			if(tx!=null)	tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		
	}
	public void fundTransferBetweenAccounts() {
		
		AccountService fromAccSer = new AccountService();
		AccountService toAccSer = new AccountService();
		AccountEntity frmAccEnt;
		AccountEntity toAccEnt;
		TransactionEntity frmTransaction = new TransactionEntity();
		TransactionKey frmTransactionKey = new TransactionKey();
		
		TransactionEntity toTransaction = new TransactionEntity();
		TransactionKey toTransactionKey = new TransactionKey();
		
		Transaction tx = null;
		Session session = SessionFactoryUtil.getSessionFactory().openSession();
		
		try {
		
			tx = session.beginTransaction();
		
			frmTransactionKey.setTransactionID(1);
			frmTransactionKey.setTranType('C');
			frmTransaction.setAccountId(fromAccount);
			frmTransaction.setTranAmount(tranAmt);
			frmTransaction.setTranDate(new Date());
			frmTransaction.setTransactionKey(frmTransactionKey);
			frmTransaction.setUserID(fromAccSer.getAccountDetails(fromAccount).getUserID());
			frmTransaction.setTranCreatedByUser(userID);
			frmAccEnt = fromAccSer.updateBalance(fromAccount,tranAmt, 'C');
			frmTransaction.setBalance(frmAccEnt.getAcctBalance());
			
			toTransactionKey.setTransactionID(1);
			toTransactionKey.setTranType('D');
			toTransaction.setAccountId(toAccount);
			toTransaction.setTranAmount(tranAmt);
			toTransaction.setTranDate(new Date());
			toTransaction.setTransactionKey(frmTransactionKey);
			toTransaction.setUserID(toAccSer.getAccountDetails(toAccount).getUserID());
			toTransaction.setTranCreatedByUser(userID);
			toAccEnt = toAccSer.updateBalance(toAccount,tranAmt, 'D');
			toTransaction.setBalance(toAccEnt.getAcctBalance());
			
			session.save(frmTransaction);
			session.save(toTransaction);
			
			session.update(frmAccEnt);
			session.update(toAccEnt);
		
			tx.commit();
			}
			catch(Exception e)
			{
				if(tx!=null)	tx.rollback();
				e.printStackTrace();
			}
			finally {
				session.close();
			}
		}
	
}
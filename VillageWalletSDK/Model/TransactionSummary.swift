import UIKit

/**
	Summary information of a transaction
 */
public protocol TransactionSummary: Payment {
	/** The ID of the transaction */
	var transactionId: String { get }

	/** An optional client reference associated with the transaction. */
	var clientReference: String? { get }

	/** The type of transaction. */
	var type: TransactionSummaryPaymentType? { get }

	/** Timestamp of when the transaction occurred */
	var executionTime: Date { get }

	/** The current status of the transactions */
	var status: TransactionSummaryPaymentStatus? { get }

	/** The rollback state of this transaction */
	var rollback: TransactionSummarySummaryRollback? { get }

	/** Array of transaction responses returned by downstream processes */
	var subTransactions: [Any]? { get }

	/** The reason provided for the refund. Only provided for REFUND transactions */
	var refundReason: String? { get }

	/** The instruments used to make the payment. For refunds and cash back amounts will be negative */
	var instruments: [TransactionSummaryUsedPaymentInstrument] { get }
}

/**
 An instrument used for a transaction
 */
public protocol TransactionSummaryUsedPaymentInstrument {
	/** The ID of the `PaymentInstrument` */
	var paymentInstrumentId: String { get }

	/** The type of the payment instrument */
	var instrumentType: String { get }

	/** The list of transactions associated with the instrument." */
	var transactions: [UsedPaymentInstrumentTransaction] { get }
}

/**
 A subtransaction associated with a payment instrument
 */
public protocol UsedPaymentInstrumentTransaction {
	/** The type of transaction. */
	var type: TransactionSummaryPaymentType? { get }

	/** Timestamp of when the transaction occurred */
	var executionTime: Date? { get }

	/** The reference for the payment. If a refund this is the reference to the transaction being refunded. */
	var paymentTransactionRef: String? { get }

	/** The reference for the refund. */
	var refundTransactionRef: String? { get }

	/** The current status of the transactions */
	var status: TransactionSummaryPaymentStatus? { get }

	/** The amount charged against or refunded to this instrument */
	var amount: Decimal? { get }
}


/**
	Allowed types of transactions
 */
public enum TransactionSummaryPaymentType: String {
	/** A payment by a customer to a merchant */
	case PAYMENT

	/** A payment by a merchant to a customer undoing a previously made customer payment */
	case REFUND

	/** A preauthorised amount is reserved but will not be taken from a customer's account until a completion is performed */
	case PREAUTH

	/** Complete a preauthorised transaction and take the amount from the customer's account */
	case COMPLETION

	/** Void a preauthorised transaction so that the money will not be taken from the customer's account */
	case VOID
}

/**
	Allowed states that a transaction can be in
 */
public enum TransactionSummaryPaymentStatus: String {
	/** The transaction is being processed */
	case PROCESSING

	/** The transaction was approved */
	case APPROVED

	/** The transaction was rejected */
	case REJECTED
}

public enum TransactionSummarySummaryRollback: String {
	case REQUIRED, NOT_REQUIRED, FAILED, SUCCESSFUL
}
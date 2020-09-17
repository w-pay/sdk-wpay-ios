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

	/** The error detail returned by downstream processes when the payment is REJECTED */
	var statusDetail: AnyObject? { get }

	/** The reason provided for the refund. Only provided for REFUND transactions */
	var refundReason: String? { get }
}

/**
	Allowed types of transactions
 */
public enum TransactionSummaryPaymentType {
		/** A payment by a customer to a merchant */
	case PAYMENT

	/** A payment by a merchant to a customer undoing a previously made customer payment */
	case REFUND

	public static func valueOf(value: String) -> TransactionSummaryPaymentType? {
		switch (value.uppercased()) {
			case "PAYMENT":
				return TransactionSummaryPaymentType.PAYMENT

			case "REFUND":
				return TransactionSummaryPaymentType.REFUND

			default:
				return nil
		}
	}
}

/**
	Allowed states that a transaction can be in
 */
public enum TransactionSummaryPaymentStatus {
	/** The transaction is being processed */
	case PROCESSING

	/** The transaction was approved */
	case APPROVED

	/** The transaction was rejected */
	case REJECTED

	public static func valueOf(value: String) -> TransactionSummaryPaymentStatus? {
		switch (value.uppercased()) {
			case "PROCESSING":
				return TransactionSummaryPaymentStatus.PROCESSING

			case "APPROVED":
				return TransactionSummaryPaymentStatus.APPROVED

			case "REJECTED":
				return TransactionSummaryPaymentStatus.REJECTED

			default:
				return nil
		}
	}
}

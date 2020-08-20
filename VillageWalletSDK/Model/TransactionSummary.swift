import UIKit

public protocol TransactionSummary: Payment {
	func transactionId() -> String

	func clientReference() -> String?

	func type() -> TransactionSummaryPaymentType?

	func executionTime() -> Date

	func status() -> TransactionSummaryPaymentStatus?

	/*
	 * The return type has yet to be defined in the spec.
	 */
	func statusDetail() -> AnyObject?

	func refundReason() -> String?
}

public enum TransactionSummaryPaymentType {
	case PAYMENT
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

public enum TransactionSummaryPaymentStatus {
	case PROCESSING
	case APPROVED
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

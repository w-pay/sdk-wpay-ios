import UIKit

public protocol TransactionSummary: Payment {
	var transactionId: String { get }

	var clientReference: String? { get }

	var type: TransactionSummaryPaymentType? { get }

	var executionTime: Date { get }

	var status: TransactionSummaryPaymentStatus? { get }

	/*
	 * The return type has yet to be defined in the spec.
	 */
	var statusDetail: AnyObject? { get }

	var refundReason: String? { get }
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

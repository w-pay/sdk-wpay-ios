import UIKit

/**
 The JSON request structure of the Transaction History endpoint.
 */
public protocol TransactionHistoryRequest {
	/* The container transaction types to include in the results. */
	var transactionTypes: [TransactionClass] { get }

	/* The ids of the payment instruments to include in the results. */
	var paymentInstrumentIds: [String] { get }

	/* A merchant application specific reference number to include in the results. */
	var clientReference: String { get }

	/* A container reference number to include in the results. */
	var transactionRef: String { get }

	/* A merchant order number to include in the results. */
	var orderNumber: String { get }

	/* Limit transactions included in the results FROM this timestamp. The timestamp format is ISO8601. */
	var startDate: String { get }

	/* Limit transactions included in the results TO this timestamp . The timestamp format is ISO8601. */
	var endDate: String { get }

	/* The max number of transactions to include in the results. */
	var maxRecords: Decimal { get }
}

public enum TransactionClass : String {
	case PREAUTH, PURCHASE, COMPLETION, VOID, REFUND
}
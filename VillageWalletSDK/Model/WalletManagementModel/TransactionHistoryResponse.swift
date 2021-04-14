import UIKit

/**
 The JSON response structure of the Transaction History endpoint.
 */
public protocol TransactionHistoryResponse {
	/* The number of transactions returned in the results. */
	var returned: Decimal { get }

	/* The total number of transactions available in the container. */
	var total: Decimal { get }

	var transactions: [Transaction] { get }
}

public protocol Transaction {
	/* The container transaction type. */
	var transactionType: ContainerTransactionType { get }

	/* Container reference in the transaction logs. This number uniquely identifies the transaction in the container. */
	var transactionRef: String { get }

	/* The container transaction timestamp. The timestamp format is ISO8601. */
	var transactionTimestamp: String { get }

	/* A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. The current implementation assigns the "clientReference" value to this property. */
	var applicationRef: String { get }

	/* The container application name of the merchant. */
	var applicationName: String { get }

	/* A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/* The merchant order number of the transaction. */
	var orderNumber: String { get }

	/* The bin (first 4 digits) of the card number used in the transaction. Will be null for transactions where bin is not applicable. */
	var bin: String { get }

	/* The type of payment instrument used in the transaction. For credit card transactions this property will contain the scheme. */
	var network: String { get }

	/* The suffix (last 4 digits) of the card number used in the transaction. Will be null for transactions where suffix is not applicable. */
	var cardSuffix: String { get }

	/* The amount of the transaction. */
	var amount: Decimal { get }

	/* The comment set in the tokenization request of Google/Apple Pay instruments. Will be null for transactions where comment is not applicable. */
	var comment: String { get }

	/* The type of the payment instrument used in the transaction. */
	var paymentInstrumentType: String { get }
}

public enum ContainerTransactionType : String {
	case PREAUTH, PURCHASE, COMPLETION, VOID, REFUND
}
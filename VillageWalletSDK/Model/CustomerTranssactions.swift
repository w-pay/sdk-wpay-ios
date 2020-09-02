import UIKit

public protocol CustomerTransactions {

}

public protocol CustomerTransactionUsedPaymentInstrument {
	var paymentInstrumentId: String { get }

	var amount: Decimal { get }

	var paymentTransactionRef: String? { get }
}

public protocol CustomerTransactionSummaries: CustomerTransactions {
	var transactions: [CustomerTransactionSummary] { get }
}

public protocol CustomerTransactionSummary: TransactionSummary {
	var merchantId: String { get }

	var instruments: [CustomerTransactionUsedPaymentInstrument] { get }
}

public protocol CustomerTransactionDetails: CustomerTransactionSummary {
	var basket: Basket? { get }
}
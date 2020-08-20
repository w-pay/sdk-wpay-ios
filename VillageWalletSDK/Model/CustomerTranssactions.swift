import UIKit

public protocol CustomerTransactions {

}

public protocol CustomerTransactionUsedPaymentInstrument {
	func paymentInstrumentId() -> String

	func amount() -> Decimal

	func paymentTransactionRef() -> String?
}

public protocol CustomerTransactionSummaries: CustomerTransactions {
	func transactions() -> [CustomerTransactionSummary]
}

public protocol CustomerTransactionSummary: TransactionSummary {
	func merchantId() -> String

	func instruments() -> [CustomerTransactionUsedPaymentInstrument]
}

public protocol CustomerTransactionDetails: CustomerTransactionSummary {
	func basket() -> Basket?
}
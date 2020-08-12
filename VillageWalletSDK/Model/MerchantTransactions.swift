import UIKit

public protocol MerchantTransactions {

}

public protocol MerchantTransactionSummaries: MerchantTransactions {
	func transactions() -> [MerchantTransactionSummary]
}

public protocol MerchantTransactionSummary: TransactionSummary {
	func walletId() -> String
}

public protocol MerchantTransactionDetails: MerchantTransactionSummary {
	func basket() -> Basket?
	func posPayload() -> PosPayload?
	func merchantPayload() -> MerchantPayload?
}
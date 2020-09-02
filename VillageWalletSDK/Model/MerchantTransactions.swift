import UIKit

public protocol MerchantTransactions {

}

public protocol MerchantTransactionSummaries: MerchantTransactions {
	var transactions: [MerchantTransactionSummary] { get }
}

public protocol MerchantTransactionSummary: TransactionSummary {
	var walletId: String { get }
}

public protocol MerchantTransactionDetails: MerchantTransactionSummary {
	var basket: Basket? { get }
	var posPayload: PosPayload? { get }
	var merchantPayload: MerchantPayload? { get }
}
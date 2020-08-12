import UIKit

public protocol MerchantPayments {

}

public protocol MerchantPaymentSummaries: MerchantPayments {
	func payments() -> [MerchantPaymentSummary]
}

public protocol MerchantPaymentSummary: Payment {
	func usesRemaining() -> Int?

	func expiryTime() -> Date?

	func specificWalletId() -> String?
}

public protocol MerchantPaymentDetails: MerchantPaymentSummary {
	func basket() -> Basket?

	func posPayload() -> PosPayload?

	func merchantPayload() -> MerchantPayload?
}
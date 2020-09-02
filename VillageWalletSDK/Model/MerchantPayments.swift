import UIKit

public protocol MerchantPayments {

}

public protocol MerchantPaymentSummaries: MerchantPayments {
	var payments: [MerchantPaymentSummary] { get }
}

public protocol MerchantPaymentSummary: Payment {
	var usesRemaining: Int? { get }

	var expiryTime: Date? { get }

	var specificWalletId: String? { get }
}

public protocol MerchantPaymentDetails: MerchantPaymentSummary {
	var basket: Basket? { get }

	var posPayload: PosPayload? { get }

	var merchantPayload: MerchantPayload? { get }
}
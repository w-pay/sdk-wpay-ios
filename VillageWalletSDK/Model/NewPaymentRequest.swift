import UIKit

public protocol NewPaymentRequest {
	var merchantReferenceId: String { get }
	var grossAmount: Decimal { get }
	var generateQR: Bool { get }
	var maxUses: Int? { get }
	var timeToLivePayment: Int? { get }
	var timeToLiveQR: Int? { get }
	var specificWalletId: String? { get }
	var basket: Basket? { get }
	var posPayload: PosPayload? { get }
	var merchantPayload: MerchantPayload? { get }
}

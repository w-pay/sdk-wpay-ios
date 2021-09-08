import UIKit

public enum DigitalPayGiftingProductDetailRedemptionType: String {
	case INSTORE, ONLINE, BOTH
}

public enum DigitalPayGiftingProductDetailAvailability: String {
	case DIGITAL, PHYSICAL, BOTH
}

/**
 Gift card product detailed data
 */
public protocol DigitalPayGiftingProductDetail : DigitalPayGiftingProduct {
	/** Display instruction on where and how to redeem the product */
	var redemptionInstructions: String? { get }

	/** The enabled redemption channels */
	var redemptionType: DigitalPayGiftingProductDetailRedemptionType { get }

	/** Terms and conditions text for the gift card product */
	var termsAndConditions: String? { get }

	/** Minimum AUD value gift card able to be purchased for this product */
	var minValue: Int { get }

	/** Maximum AUD value gift card able to be purchased for this product */
	var maxValue: Int { get }

	/** Expiry period for the gift card product once purchased */
	var expiryPeriodInDays: Int? { get }

	/** Display text for the expiry period */
	var expiryPeriodText: String? { get }

	/** Returns true if the gift card product is active, else false. Only active programs are orderable */
	var isActive: Bool { get }

	/** The stores in which the gift card product is able to be redeemed */
	var redemptionStores: [String]? { get }

	/** Digital or phyiscal availability of the gift card */
	var availability: DigitalPayGiftingProductDetailAvailability { get }

	/** Array of all alternative designs for the gift card product */
	var designs: [GiftingProductDesign] { get }
}

import UIKit

public enum DigitalPayGiftingProductBarCodeType: String {
	case PAN, GTIN
}

/**
 * Gift card product summary data
 */
public protocol DigitalPayGiftingProduct {
	/** Unique identifier assigned to gift card program */
	var productId: String { get }

	/** Display name of the gift card program */
	var name: String { get }

	/** The manner in which the barcode is displayed for optical recognition (can be used to drive CX experience flows) */
	var barCodeType: DigitalPayGiftingProductBarCodeType  { get }

	/** The timestamp the gift card program was last updated. */
	var lastUpdateDateTime: Date { get }

	/** The aesthectic design of a gift card product */
	var defaultDesign: GiftingProductDesign { get }

	/** A discount offered for a gift card product */
	var discountOffered: GiftingProductDiscount? { get }
}

public enum GiftingProductDesignDesignType: String {
	case DIGITAL, PHYSICAL
}

public protocol GiftingProductDesign {
	/** Unique (within the scope of designType) identifier of the aesthectic design of the gift card */
	var designId: String { get }

	/** Format of the design (note that different design types have different unique IDs) */
	var designType: GiftingProductDesignDesignType { get }

	/** URL to the image for the gift card design */
	var imageUrl: String { get }
}

public protocol GiftingProductDiscount {
	/** Unique identifier of the discount */
	var discountId: String { get }

	/** Display description of the discount */
	var description: String { get }

	/** Percentage discount offered on the gift card */
	var percentageDiscount: Int { get }

	/** The start date of the offered discount. */
	var startDate: Date { get }

	/** The end date of the offered discount. */
	var endDate: Date { get }
}

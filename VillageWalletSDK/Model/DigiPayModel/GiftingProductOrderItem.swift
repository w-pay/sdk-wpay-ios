import UIKit

public protocol GiftingProductOrderItem {
	/** Unique identifier of the design selected */
	var designId: String { get }

	/** Face value of the gift card */
	var amount: Decimal { get }

	/** For self use card, this can be any value between 1 and 10. For a gifting card, it must be 1 */
	var quantity: Int { get }

	/** If true its a gifting card, if false it is a self use card */
	var isGifting: Bool { get }

	/** For a gifting card, contains the recipient details */
	var recipientDetails: RecipientDetail? { get }
}

public protocol RecipientDetail {
	/** Name of sender */
	var toName: String { get }

	/** Name of recipient */
	var fromName: String { get }

	/** Optional message to be sent as part of gift card delivery */
	var message: String? { get }

	/** Optional image URL for personalisation purposes */
	var imageUrl: String? { get }

	/** Australian mobile number of recipient. Only SMS delivery method is supported for gifting card */
	var mobileNumber: String { get }
}

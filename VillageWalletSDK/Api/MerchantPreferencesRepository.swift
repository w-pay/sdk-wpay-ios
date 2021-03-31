import UIKit

/**
	Dictionary of merchant preferences.
 */
public typealias MerchantPreferences = [String: [String: String]]

public protocol MerchantPreferencesRepository {
	/**
	 Retrieve a merchant's preferences.
	 */
	func get(completion: @escaping ApiCompletion<MerchantPreferences>)

	/**
	 Update a merchant's preferences

	 - Parameter preferences: The preferences to use
	 */
	func set(preferences: MerchantPreferences, completion: @escaping ApiCompletion<Void>)
}
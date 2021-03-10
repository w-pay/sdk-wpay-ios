import UIKit

/**
 Dictionary of customer preferences.
 */
public typealias CustomerPreferences = [String: [String: String]]

public protocol CustomerPreferencesRepository {
	/**
	 Retrieve a customer's preferences
	 */
	func get(completion: @escaping ApiCompletion<CustomerPreferences>)

	/**
	 Update the preferences for a customer

	 - Parameter preferences: The preferences of the customer.
	 */
	func set(
		preferences: CustomerPreferences,
		completion: @escaping ApiCompletion<CustomerPreferences>
	)
}
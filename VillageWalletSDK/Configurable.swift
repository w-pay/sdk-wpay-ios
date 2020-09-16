import UIKit

/**
	What can be configured in the SDK post SDK initialisation.
 */
public protocol Configurable {
	/**
	 Sets the API host that the SDK uses.

	 - Parameter host: The host (including protocol and port) of the API server
	 - Returns: Void
	*/
	func setHost(host: String)
}

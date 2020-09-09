import UIKit

/**
	Creates a Dictionary of headers to be added to HTTP requests
 */
public protocol RequestHeadersFactory {
	/**
	 - Returns: A Dictionary of headers to be added to HTTP requests
	 */
	func createHeaders() -> [String: String]
}

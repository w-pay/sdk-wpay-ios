import UIKit

/**
	Abstracts how HTTP headers are added to a Dictionary.
 */
public protocol RequestHeaderFactory {
	/**
		Adds a name and value to a Dictionary of HTTP request headers

		- Parameter headers: A Dictionary of HTTP request headers
	 */
	func addHeaders(headers: inout [String: String]) -> Void
}

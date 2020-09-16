import UIKit

/**
	Errors that can be thrown by API operations
 */
public enum ApiError: Error {
	/** Details of encoding errors will be library specific */
	case jsonEncoding(message: String, details: [String: Any])

	/** Details of decoding errors will be library specific */
	case jsonDecoding(message: String, details: [String: Any])

	/** When the server returns an HTTP error */
	case httpError(reason: HTTPErrorReason, response: HTTPURLResponse)

	/** Catch all */
	case error(error: Error)

	/**
	 Reasons that the API may return an error.

	 If an unknown status code is returned, the default is to return `serverError`
	 */
	public enum HTTPErrorReason: Int {
		case invalidInput = 400
		case unauthorised = 401
		case processingError = 422
		case serverError = 500
	}
}

/**
	Completion type for API operations
 */
public typealias ApiCompletion<T> = (Result<T, ApiError>) -> Void

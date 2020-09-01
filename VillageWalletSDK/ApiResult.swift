import UIKit

public enum ApiError: Error {
	/* details of encoding/decoding errors will be library specific */
	case jsonEncoding(message: String, details: [String: Any])
	case jsonDecoding(message: String, details: [String: Any])
	case httpError(reason: HttpErrorReason, response: HTTPURLResponse)

	// catch all
	case error(error: Error)

	public enum HttpErrorReason: Int {
		case invalidInput = 400
		case unauthorised = 401
		case processingError = 422
		case serverError = 500
	}
}

public typealias ApiResult<T> = (Result<T, ApiError>) -> Void

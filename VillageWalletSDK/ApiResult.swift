import UIKit

public enum ApiError: Error {
	case jsonEncoding
	case jsonDecoding
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


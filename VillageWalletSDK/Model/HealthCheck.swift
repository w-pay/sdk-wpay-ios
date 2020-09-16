import UIKit

/**
	Result of checking the health of the API server
 */
public protocol HealthCheck {
	/**
		Health check result

	  - Returns: `nil` if invalid API data received.
	 */
	var result: HealthCheckStatus? { get }
}

/**
	Possible health states that the API server can be in.
 */
public enum HealthCheckStatus {
	/** The API server is healthy */
	case SUCCESS

	/**
		Convert a string to an instance of `HealthCheckStatus`

		- Parameter value: A string
		- Returns: nil if `value` is not a valid representation of an enum value
	 */
	public static func valueOf(value: String) -> HealthCheckStatus? {
		switch (value.uppercased()) {
			case "SUCCESS":
				return HealthCheckStatus.SUCCESS

			default:
				return nil
		}
	}
}

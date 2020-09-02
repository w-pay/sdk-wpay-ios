import UIKit

public protocol HealthCheck {
	/**
	 * @return nil if invalid API data received.
	 */
	var result: HealthCheckStatus? { get }
}

public enum HealthCheckStatus {
	case SUCCESS

	public static func valueOf(value: String) -> HealthCheckStatus? {
		switch (value.uppercased()) {
			case "SUCCESS":
				return HealthCheckStatus.SUCCESS

			default:
				return nil
		}
	}
}

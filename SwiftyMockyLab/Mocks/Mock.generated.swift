// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import Foundation


// MARK: - CatDataService

open class CatDataServiceMock: CatDataService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getFact() throws -> CatFact {
        addInvocation(.m_getFact)
		let perform = methodPerformValue(.m_getFact) as? () -> Void
		perform?()
		var __value: CatFact
		do {
		    __value = try methodReturnValue(.m_getFact).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getFact(). Use given")
			Failure("Stub return value not specified for getFact(). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func getFacts(limit: Int) throws -> [CatFact] {
        addInvocation(.m_getFacts__limit_limit(Parameter<Int>.value(`limit`)))
		let perform = methodPerformValue(.m_getFacts__limit_limit(Parameter<Int>.value(`limit`))) as? (Int) -> Void
		perform?(`limit`)
		var __value: [CatFact]
		do {
		    __value = try methodReturnValue(.m_getFacts__limit_limit(Parameter<Int>.value(`limit`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for getFacts(limit: Int). Use given")
			Failure("Stub return value not specified for getFacts(limit: Int). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getFact
        case m_getFacts__limit_limit(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getFact, .m_getFact): return .match

            case (.m_getFacts__limit_limit(let lhsLimit), .m_getFacts__limit_limit(let rhsLimit)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsLimit, rhs: rhsLimit, with: matcher), lhsLimit, rhsLimit, "limit"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getFact: return 0
            case let .m_getFacts__limit_limit(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getFact: return ".getFact()"
            case .m_getFacts__limit_limit: return ".getFacts(limit:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getFact(willReturn: CatFact...) -> MethodStub {
            return Given(method: .m_getFact, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getFacts(limit: Parameter<Int>, willReturn: [CatFact]...) -> MethodStub {
            return Given(method: .m_getFacts__limit_limit(`limit`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getFact(willThrow: Error...) -> MethodStub {
            return Given(method: .m_getFact, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getFact(willProduce: (StubberThrows<CatFact>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getFact, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (CatFact).self)
			willProduce(stubber)
			return given
        }
        public static func getFacts(limit: Parameter<Int>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_getFacts__limit_limit(`limit`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func getFacts(limit: Parameter<Int>, willProduce: (StubberThrows<[CatFact]>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_getFacts__limit_limit(`limit`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: ([CatFact]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getFact() -> Verify { return Verify(method: .m_getFact)}
        public static func getFacts(limit: Parameter<Int>) -> Verify { return Verify(method: .m_getFacts__limit_limit(`limit`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getFact(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getFact, performs: perform)
        }
        public static func getFacts(limit: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_getFacts__limit_limit(`limit`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}


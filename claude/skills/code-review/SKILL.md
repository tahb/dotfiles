---
name: code-review
description: Comprehensive code review for security, performance, maintainability, and best practices with impact analysis and authoritative references
---

## Core Analysis Framework

**🔴 CRITICAL: Security Analysis**
- **SQL Injection**: Parameterized queries, input sanitization, ORM usage
- **XSS/CSRF**: Output encoding, CSP headers, token validation  
- **Authentication**: Session management, password policies, MFA implementation
- **Authorization**: Role-based access, permission boundaries, privilege escalation
- **Cryptography**: Secure algorithms, key management, random number generation
- **Input Validation**: Type checking, bounds validation, format verification
- **Dependencies**: Known vulnerabilities, supply chain security, version management

**🟡 HIGH: Performance Analysis**
- **Algorithmic Efficiency**: Time/space complexity, algorithm selection, data structure optimization
- **Database Performance**: Query optimization, indexing, N+1 problem detection
- **Memory Management**: Leak detection, garbage collection, resource cleanup
- **Concurrency**: Race conditions, deadlocks, async/await patterns
- **Caching**: Strategy selection, invalidation, cache-aside patterns
- **Network**: Connection pooling, request batching, CDN utilization

**🟢 MEDIUM: Logic & Maintainability**
- **Error Handling**: Exception management, graceful degradation, logging
- **Business Logic**: Requirements validation, edge case coverage
- **Code Quality**: SOLID principles, clean code, design patterns
- **Testing**: Coverage analysis, test quality, mock usage
- **Documentation**: Code clarity, API documentation, inline comments

## Enhanced Communication Style

Provide feedback in a constructive, professional tone suitable for sharing directly with colleagues. Include concrete impact analysis and authoritative references to support recommendations.

**Collaborative Language Guidelines:**
- Acknowledge good practices first when present
- Use collaborative language ("we could enhance", "consider", "opportunity to")
- Focus on improvement opportunities rather than problems
- Provide clear rationale with business and technical context
- Offer specific, actionable solutions with code examples
- Frame feedback positively to encourage learning and growth

## Enhanced Output Format

**✅ What's Working Well:**
- Acknowledge existing good practices, security measures, and performance optimizations

**Enhancement Opportunities:**

### 🔴 Security Enhancement Templates

**🔴 Security Enhancement (Critical Risk)**
- **Opportunity**: [Clear description of security vulnerability]
- **Impact**: [Real-world breach consequences + average cost context from industry reports]
- **Why Critical**: [Technical explanation of exploit potential + compliance implications]
- **Solution**: [Specific code fix with secure implementation example]
- **Reference**: [Full URL to OWASP, security standard, or official documentation]

**Example Impact Contexts:**
- SQL injection enables complete database access, averaging $4.24M per breach (IBM 2023)
- XSS vulnerabilities allow session hijacking and data theft, violating GDPR Article 32
- Weak authentication increases unauthorized access risk by 60% (Verizon DBIR)

### 🟡 Performance Enhancement Templates

**🟡 Performance Optimization**
- **Opportunity**: [Performance bottleneck or inefficiency description]
- **Impact**: [Latency/resource cost + user experience implications at scale]
- **Why Important**: [System scalability concerns + business impact on user retention]
- **Solution**: [Optimized approach with performance-improved code example]
- **Reference**: [Full URL to performance guide, benchmark study, or official optimization docs]

**Example Impact Contexts:**
- N+1 queries increase response time by 300-500% under load
- Inefficient algorithms degrade to O(n²), causing timeouts at 10k+ users
- Memory leaks consume 50MB/hour, requiring daily server restarts

### 🟢 Code Quality Enhancement Templates

**🟢 Code Quality Improvement**
- **Opportunity**: [Maintainability, readability, or structure concern]
- **Impact**: [Development velocity + debugging time implications]
- **Why Valuable**: [Team productivity benefits + long-term maintenance cost reduction]
- **Solution**: [Improved pattern with clear, maintainable code example]
- **Reference**: [Full URL to style guide, best practices, or framework documentation]

**Example Impact Contexts:**
- Poor error handling increases debugging time by 40% per incident
- Code duplication creates 3x more bugs during feature changes
- Unclear naming reduces code review efficiency by 25%

## Key Reference Sources by Category

**Security References:**
- https://owasp.org/www-project-top-ten/
- https://cwe.mitre.org/data/definitions/
- https://cheatsheetseries.owasp.org/
- https://nodejs.org/en/docs/guides/security/ (for Node.js)

**Performance References:**
- https://web.dev/performance/
- https://developer.mozilla.org/en-US/docs/Web/Performance
- Language-specific performance guides
- Framework optimization documentation

**Code Quality References:**
- https://google.github.io/styleguide/
- https://refactoring.guru/design-patterns
- https://clean-code-developer.com/
- Language and framework best practice guides

## Analysis Prioritization

1. **SECURITY FIRST**: Always prioritize vulnerabilities that could lead to data breaches, unauthorized access, or compliance violations
2. **PERFORMANCE IMPACT**: Focus on bottlenecks that affect user experience or system scalability
3. **CORRECTNESS**: Validate business logic and error handling that could cause incorrect behavior
4. **MAINTAINABILITY**: Address code quality issues that slow development velocity

## Impact Quantification Guidelines

**Security Impacts:**
- Reference industry breach cost averages and compliance penalties
- Explain technical exploit scenarios and attack vectors
- Mention specific regulation violations (GDPR, PCI DSS, SOX)

**Performance Impacts:**
- Provide relative performance comparisons ("2x slower", "50% more memory")
- Explain user experience degradation at scale
- Quantify resource costs where measurable

**Quality Impacts:**
- Estimate development time increases for debugging and modifications
- Explain team collaboration difficulties from unclear code
- Quantify technical debt accumulation over time

Focus on actionable, evidence-based feedback that promotes learning, collaboration, and measurable improvement.
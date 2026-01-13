# WEEK -1 RETROSPECTIVE

The approach followed was:
theory → execution → verification → failure → fix → documentation

# DAY -1 System Reverse Engineering with Node & Terminal


Tasks done:
- Identified OS version, shell, node binary path, npm path, and PATH variables using terminal commands.
- Understood how PATH resolution works and how the shell locates binaries.
- Installed and used NVM to switch between Node versions.
- Created an introspect.js script to print system-level information like CPU cores, memory, uptime, user, and node path.
- Performed a STREAM vs BUFFER experiment using fs.readFile and fs.createReadStream.
- Generated large files (50MB+) and measured memory usage using /usr/bin/time -v.
- Observed how buffering leads to high RSS memory while streaming keeps memory constant.

learning:
Blindly reading files into memory is dangerous at scale.

Real-world production use case:
- Log processing systems
- File upload services
- ETL pipelines
- Any backend handling large files must use streaming to avoid OOM crashes


# DAY -2 Node CLI App with Concurrency and  Large Data Processing


Tasks done:
- Generated a large corpus file with 250,000 words.
- Built a CLI tool (wordstat.js) with proper argument parsing.
- Implemented flags like --file, --top, --minLen, --unique, --workers.
- Validated inputs before execution (fail fast approach).
- Used streaming to read files safely.
- Implemented worker_threads for CPU-bound word counting.
- Built a fixed-size worker pool instead of spawning workers per task.
- Implemented backpressure using pause/resume on streams.
- Benchmarked performance for different worker counts and observed diminishing returns beyond CPU cores.
- Verified correctness by comparing outputs with single vs multiple workers.

learning:
Concurrency must be controlled. Parallelism without limits causes resource exhaustion.

Real-world production use case:
- Analytics pipelines
- Text indexing engines
- Search preprocessing systems
- CPU-heavy background jobs separated from I/O


# DAY -3 Git Mastery (Recovery & Debugging)

Tasks done:
- Created a repo with multiple commits and intentionally introduced a bug.
- Built a small log processing script (log.js + app.log).
- Used git bisect to identify the exact commit that introduced the bug.
- Verified outputs manually at each bisect step.
- Used git revert instead of reset to fix the buggy commit while preserving history.
- Used git stash to save uncommitted changes and restore them later.
- Created merge conflicts by modifying the same line in different branches and resolved them manually.

learning:
Git is not just version control, it is a debugging and recovery tool.

Real-world production use case:
- Hotfixing production bugs
- Auditing changes
- Debugging regressions
- Collaborative team workflows


# DAY -4 HTTP / API Forensics

Tasks done:
- Used nslookup and traceroute to understand DNS resolution and network hops.
- Used curl to inspect raw HTTP requests and responses.
- Observed headers like User-Agent, Authorization, ETag, Cache-Control.
- Tested pagination parameters using real APIs.
- Simulated caching using ETag and If-None-Match headers.
- Built a minimal Node.js HTTP server without any framework.
- Implemented endpoints like /health, /echo, /slow, /cache.
- Understood why health endpoints return simple responses.
- Learned defensive server design and routing without frameworks.
- Used Postman to visualize and verify API behavior.

learning:
Frameworks hide important details. Understanding raw HTTP is mandatory.

Real-world production use case:
- API gateways
- Microservices health checks
- Load balancer integrations
- Debugging client-server issues


# DAY -5 Automation & Mini CI Pipeline

Tasks done:
- Created validate.sh script to enforce repository rules.
- Ensured config.json exists and is valid JSON.
- Logged validation results with timestamps.
- Added ESLint and Prettier to enforce code quality.
- Configured Husky pre-commit hooks.
- Blocked commits when lint, format, or validation failed.
- Verified that broken code cannot be committed.
- Created build artifacts using tar (build-1768285983.tgz).
- Included source code and logs in the artifact.
- Generated SHA256 checksums for integrity verification.
- Set up cron jobs to execute scripts periodically.
- Debugged cron environment issues (PATH, nvm, absolute paths).
- Verified scheduled execution using cron.log.

learning:
Humans are unreliable. Automation enforces discipline.

Real-world production use case:
- CI/CD pipelines
- Release packaging
- Compliance checks
- Scheduled jobs and background workers


# OVERALL WEEK-1 LEARNINGS

- Systems must be understood before being used.
- Verification is as important as implementation.
- Failures are learning tools, not mistakes.
- Automation prevents human errors.
- Logs, metrics, and exit codes matter more than console output.
- Production engineering is about predictability and safety.


# TASKS THAT  BROKE DURING THE WEEK

- Cron jobs failed due to missing entries.
- Node path issues due to nvm not loading in cron.
- Prettier could not fix syntactically broken code.
- Globbing behavior with tar caused confusion.
- Missing validations initially led to incomplete automation.



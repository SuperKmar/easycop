### 📦 Installation & Usage

1. **Install the gem** (after building):
   ```bash
   gem build easy_cop.gemspec
   gem install easy_cop-0.1.0.gem
   ```

2. **Run the CLI**:
   ```bash
   easy_cop
   ```

---

### 📌 Features

- **Detects files with the fewest RuboCop offenses**
- **Outputs relative file paths** for clarity
- **Handles edge cases** like no offenses or multiple files with the same count
- **Requires RuboCop** (automatically added as a dependency)

---

### 🧠 Notes

- The tool assumes the current working directory is the root of your project.
- If no offenses are found, it informs the user that all files are clean.
- You can extend this to support custom RuboCop configurations or command-line flags for more advanced use.

---

### 🚀 Next Steps

- Add support for configuration files (e.g., `.rubocop.yml`)
- Allow filtering by file types or directories
- Integrate with CI pipelines for code quality checks

This gem is a simple yet powerful utility for developers looking to prioritize their code cleanup efforts! 🚀
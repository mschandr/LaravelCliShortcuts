# Contributing

Thanks for pitching in.

## Rules of the road
1. Scripts must be POSIX-compatible and pass `shellcheck` with no errors.
2. Quote paths. Support directories with spaces.
3. Avoid external dependencies beyond standard macOS/Linux installs.
4. Include a short header comment explaining purpose and usage.
5. Keep UX consistent: fail fast with clear messages and exit codes.

## Dev setup
- Install `shellcheck`.
- Run scripts in both bash and zsh.
- If a script touches multiple projects (like `cache-clear-all`), add a `--dry-run` mode.

## Submitting a PR
- Describe the use case and sample commands.
- Add to README "What's Inside" table if user facing.
- Keep changes small and focused.

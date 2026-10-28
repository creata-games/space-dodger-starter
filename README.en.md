# Space Dodger Starter — practicum starting point

[Русский](README.md)

The starting project for **Topic 1 of the Space Dodger practicum** at the Creata Games
GameDev School, prepared for the [creata-games](https://github.com/creata-games) GitHub
organization. The editor settings and MCP bridge are ready. The main scene contains
only `Main` and a camera. Press F5 to see an empty field; you will build the mechanics
and add your own materials during the practicum.

- The «Space Dodger» practicum — GameDev School, Creata Academy
- [Play the finished game](https://play.creata.games/game?id=space_dodger)
- Download the project: **Code → Download ZIP**, then extract the archive.

## Requirements

| Tool | Purpose |
|---|---|
| [Godot 4.7.2 stable](https://godotengine.org/download/archive/4.7.2-stable/) | Standard GDScript build; this project uses 2D and Compatibility |
| [Claude Code](https://code.claude.com/docs/en/setup) | Coding assistant; install it and sign in with your own access |
| [uv and uvx](https://docs.astral.sh/uv/getting-started/installation/) | Run the Godot AI Python server; both commands must be available in your terminal |
| Python 3 | Practicum helper scripts; uv manages the bridge's Python environment |

The first installation of the bridge's Python package needs internet access. Image and
audio generators are optional for opening the starter: you can use your own materials
or geometric placeholders.

Check the commands (on Windows, use `py -3` instead of `python3` if needed):

```bash
godot --version
claude --version
uv --version
uvx --version
python3 --version
```

The `godot` command must run 4.7.2. If it is missing from PATH, use the full path to
the editor executable. You will need matching export templates later in the practicum.

## Open the project

1. Open a terminal in the extracted `space-dodger-starter` folder, next to `project.godot`.
2. Disable bridge telemetry before the first launch and start the editor from this folder.
   macOS/Linux:

   ```bash
   GODOT_AI_DISABLE_TELEMETRY=1 godot --editor --path .
   ```

   Windows PowerShell:

   ```powershell
   $env:GODOT_AI_DISABLE_TELEMETRY = "1"
   godot --editor --path .
   ```

   If you use the Project Manager, set the same environment variable for the Godot
   process first, then choose **Import → project.godot → Import & Edit**.
3. In **Editor → Editor Settings**, find `godot_ai`: disable `telemetry_enabled`,
   set `mcp_client_scope = project`, and leave `allow_remote_hosts` empty.
   These editor settings live on your computer; `project.godot` does not set them.
4. Open `scenes/main.tscn` in **2D** mode. Press **F5**, check the empty field, then
   stop it with **■**. The camera is centered at `(960, 540)`.

The viewport is 1920×1080, the window is 1280×720, stretch is `canvas_items`, and the
texture filter is Nearest. **Master**, **Music**, and **SFX** buses are configured;
audio files will be added later.

## Connect your assistant

Godot AI **4.3.0** is included in `addons/godot_ai/` and enabled in `project.godot`.
Keep the editor open with this project.

1. Check **Project → Project Settings → Plugins → Godot AI** is enabled.
   Wait for **Server connected** in the **Godot AI** dock.
2. The included `.mcp.json` is a project-scoped configuration. It runs `uvx` from PATH,
   pins `godot-ai==4.3.0`, uses local ports **8000** and **9500**, and disables client
   telemetry. The bridge needs no credentials. PyPI supplies the package; communication
   with the editor stays local.
3. In another terminal in the same folder, run `claude`. On first launch, sign in,
   trust the project folder, and approve the `godot-ai` server from `.mcp.json`.
4. Enter **`/mcp`**: `godot-ai` should be **connected**. Ask:

   > Which godot-ai tools can you use? Read the open scene tree and capture
   > the empty scene without changing anything.

   Expect `Main → Camera` in the scene tree. For a game screenshot, run F5; stop the
   game before editing its scene. Your assistant reads the rules in `CLAUDE.md`.

If the connection fails, check `uvx --version`, the open editor, and whether ports
8000/9500 are available. Restart `claude` from the project root. If you change the ports,
match the values in the Godot AI dock and `.mcp.json`. **Configure** is optional because
the configuration is included. Before using it, check scope `project` and launch the
editor from the project folder. If MCP is unavailable, edit files with your assistant
and verify the result manually in Godot.

## Contents

| Path | Purpose |
|---|---|
| `project.godot`, `scenes/main.tscn` | Settings and an empty scene with a camera |
| `default_bus_layout.tres` | Music/SFX route to Master |
| `addons/godot_ai/` | MCP bridge 4.3.0 with its original MIT license |
| `.mcp.json`, `CLAUDE.md` | Local connection and assistant rules |
| `assets/sprites/`, `assets/sprites/obstacles/`, `assets/audio/`, `assets/fonts/` | Empty folders with `.gitkeep` for your materials |
| `scripts/` | Empty folder for your code |
| `data/obstacles.json` | Catalog format: an `obstacles` array with one disabled example |
| `tests/smoke_test.gd` | Built-in SceneTree stub: checks scene loading and the camera |

The example has empty `sprite` and `game.behavior` fields, `game.enabled = false`,
and `weight = 0`. At the obstacle step, replace it with your own data: add a PNG to
`assets/sprites/obstacles/`, set its `res://assets/sprites/obstacles/…` path, and fill in
the description, collision shape, and behavior parameters. Enable the entry and assign
a weight after implementing the loader and behavior. Nothing loads the catalog yet.
The lab's `Assets/Sprites/` paths become `assets/sprites/` here; use this project's casing.

Input Map actions are configured. You will implement their game behavior later:

| Action | Keys |
|---|---|
| `move_up`, `move_left`, `move_down`, `move_right` | WASD and arrow keys |
| `shoot` | Space / J |
| `dash` | Shift / K |
| `pause` | Esc / P |
| `restart` | R |

## Check the starter and begin Topic 1

From the project root:

```bash
godot --headless --path . --editor --import
godot --headless --path . -s tests/smoke_test.gd
```

Expect the second command to print `OK: starter scene loaded. Gameplay checks are still TODO.`
This only confirms the starter scene loads. Add gameplay checks as you implement mechanics.

Before Topic 1, check the versions, F5, `/mcp`, the scene tree, and a screenshot. Read
the topic and rubric. Create `ЖУРНАЛ.md` for your decisions and `ИИ-ЖУРНАЛ.md` for the
assistant's work and your own checks. Save the initial state in your own version history.
Then prepare your sprites or placeholders and agree on a plan for the first game loop
with your assistant, following the topic assignment.

## License

MIT, **© 2026 Creata Games** — see [LICENSE](LICENSE).
Godot AI is distributed under its own [MIT license](addons/godot_ai/LICENSE),
© 2025 Godot AI contributors. Its source files are included unchanged.

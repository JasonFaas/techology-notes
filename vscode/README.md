# VS Code Settings

## Workspace Color Customization

Open workspace settings via `Cmd+Shift+P` → **Preferences: Open Workspace Settings (JSON)**, then add the following inside the json:

```json
,
    "workbench.colorCustomizations": {
        // The main top bar
        "titleBar.activeBackground": "#0000b8",
        "titleBar.activeForeground": "#ffffff",

        // The bottom bar
        "statusBar.background": "#0000b8",
        "statusBar.foreground": "#ffffff",
    },
```

This sets blue title and bottom bars with white text — useful for distinguishing between multiple VS Code windows (e.g., different repos or environments).

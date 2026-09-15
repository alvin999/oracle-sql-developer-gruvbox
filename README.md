# Gruvbox Dark for Oracle SQL Developer

[English](#english) | [繁體中文](#繁體中文)

---

<a name="english"></a>
## English

> A retro groove dark theme for [Oracle SQL Developer](https://www.oracle.com/database/technologies/appdev/sql-developer.html), based on the classic [Gruvbox](https://github.com/morhetz/gruvbox) color scheme and structured after [dracula/oracle-sql-developer](https://github.com/dracula/oracle-sql-developer).

![Preview Screenshot](./screenshots/cover.png)

> **Font Recommendation**: [Sarasa Term TC (等距更紗黑體 TC)](https://github.com/be5invis/Sarasa-Gothic) (Size: 16) as demonstrated in the preview screenshot.  
> Set via **Tools** > **Preferences** > **Code Editor** > **Fonts**.


### Color Palette

| Syntax Element | Gruvbox Dark | Gruvbox Soft Dark | Role in Syntax |
| :--- | :--- | :--- | :--- |
| **Background** | ![](./assets/swatches/282828.svg) `#282828` | ![](./assets/swatches/32302f.svg) `#32302f` | Editor background |
| **Foreground** | ![](./assets/swatches/ebdbb2.svg) `#ebdbb2` | ![](./assets/swatches/e0cda5.svg) `#e0cda5` | Plain text, identifiers |
| **Red** | ![](./assets/swatches/fb4934.svg) `#fb4934` | ![](./assets/swatches/f3594b.svg) `#f3594b` | Keywords, attribute names |
| **Green** | ![](./assets/swatches/b8bb26.svg) `#b8bb26` | ![](./assets/swatches/b1b946.svg) `#b1b946` | Strings, additions |
| **Yellow** | ![](./assets/swatches/fabd2f.svg) `#fabd2f` | ![](./assets/swatches/e9b243.svg) `#e9b243` | Elements, constants, headers |
| **Orange** | ![](./assets/swatches/fe8019.svg) `#fe8019` | ![](./assets/swatches/f38534.svg) `#f38534` | Operators, braces, delimiters |
| **Purple** | ![](./assets/swatches/d3869b.svg) `#d3869b` | ![](./assets/swatches/d3869b.svg) `#d3869b` | Numbers, units |
| **Gray** | ![](./assets/swatches/928374.svg) `#928374` | ![](./assets/swatches/928374.svg) `#928374` | Comments, unused text |
| **Dark Red** | ![](./assets/swatches/cc241d.svg) `#cc241d` | ![](./assets/swatches/cc241d.svg) `#cc241d` | Errors, deletions |
| **Selection** | ![](./assets/swatches/504945.svg) `#504945` | ![](./assets/swatches/504945.svg) `#504945` | Selection & highlight background |
| **Caret Line** | ![](./assets/swatches/3c3836.svg) `#3c3836` | ![](./assets/swatches/3c3836.svg) `#3c3836` | Current line highlight background |

### Installation

> [!WARNING]
> **Close Oracle SQL Developer completely before proceeding.**
> If you edit `dtcache.xml` while SQL Developer is open, the application will overwrite your changes upon exit.

#### 1. Locate `dtcache.xml`

Find the `dtcache.xml` file in your SQL Developer settings folder:

- **Windows**:
  ```text
  %APPDATA%\SQL Developer\system<version>\o.ide.<version>\dtcache.xml
  ```
  *(Example: `C:\Users\<Username>\AppData\Roaming\SQL Developer\system23.1.0.097.1607\o.ide.13.0.0.1.42.220309.2132\dtcache.xml`)*

- **macOS**:
  ```text
  ~/.sqldeveloper/system<version>/o.ide.<version>/dtcache.xml
  ```

- **Linux**:
  ```text
  ~/.sqldeveloper/system<version>/o.ide.<version>/dtcache.xml
  ```

#### 2. Insert Gruvbox Scheme

1. Open `dtcache.xml` with a text editor (e.g., VS Code, Notepad++).
2. Search for the `<schemeMap>` tag (located under `<Key>SyntaxSchemes</Key>` near the top of the file).
3. Paste the contents of [`Gruvbox-Dark.xml`](./Gruvbox-Dark.xml) and/or [`Gruvbox-Soft-Dark.xml`](./Gruvbox-Soft-Dark.xml) inside `<schemeMap>` (alongside built-in themes such as `Classic` or `Twilight`):
   ```xml
   <dt-cache class="java.util.HashMap" xmlns="http://xmlns.oracle.com/jdeveloper/110000/dt-cache">
      <Item>
         <Key>SyntaxSchemes</Key>
         <Value class="oracle.ide.ceditor.options.SyntaxSchemes">
            <schemeMap>
               <!-- Existing built-in themes (Classic, Default, etc.) -->
               <Item>
                  <Key>Classic</Key>
                  ...
               </Item>

               <!-- Paste Gruvbox <Item> blocks here (you can include both!) -->
               <Item>
                  <Key>Gruvbox Dark</Key>
                  ...
               </Item>
               <Item>
                  <Key>Gruvbox Soft Dark</Key>
                  ...
               </Item>
            </schemeMap>
         </Value>
      </Item>
   </dt-cache>
   ```
4. Save and close `dtcache.xml`.

#### 3. Activate the Theme

1. Launch **Oracle SQL Developer**.
2. Navigate to **Tools** > **Preferences** (工具 > 偏好設定).
3. In the left panel, expand **Code Editor** (程式碼編輯器) and select **PL/SQL Syntax Colors** (PL/SQL 語法色彩).
4. In the **Scheme** (配置) dropdown menu, choose **Gruvbox Dark** or **Gruvbox Soft Dark**.
5. Click **OK** (確定) to apply.

![Preferences Setting](./screenshots/setting.png)

---

### Troubleshooting

- **Theme doesn't appear in the dropdown**:
  - Make sure SQL Developer was completely closed before modifying `dtcache.xml`.
  - Verify that `<Item>` and `</Item>` tags were correctly pasted inside `<schemeMap>` without breaking XML hierarchy.
- **Multiple version folders**:
  - If you upgraded SQL Developer previously, multiple `system<version>` folders might exist in `%APPDATA%` or `~/.sqldeveloper`. Make sure you are modifying the one corresponding to the version you are currently launching.

---

### Advanced: UI Look & Feel Customization (FlatLaf)

While SQL Developer only styles the code editor by default, you can modernize the entire application frame (menus, toolbars, sidebars) by injecting **[FlatLaf](https://github.com/JFormDesigner/FlatLaf)**.

> [!TIP]
> **Why a light UI theme for the outer frame?**  
> In Oracle SQL Developer's Swing interface, certain tab labels and text elements are hardcoded in black (`#000000`). If a full-dark Look & Feel is applied, these tab titles can become difficult to read due to poor contrast.  
> A proven solution is pairing a clean, light FlatLaf theme (such as **FlatSolarizedLightIJTheme**) for the outer UI with the dark **Gruvbox** code editor. This ensures all tab titles remain crystal clear while providing a sleek, modern, flat application frame!

#### Setup Steps:

1. Download **`flatlaf-<version>.jar`** and **`flatlaf-intellij-themes-<version>.jar`** from [Maven Central](https://repo1.maven.org/maven2/com/formdev/) (replace `<version>` with the latest release, e.g. `3.7.2` or newer).
2. Place both JAR files in `<SQL_Developer_Directory>/sqldeveloper/lib/`.
3. Open `<SQL_Developer_Directory>/sqldeveloper/bin/sqldeveloper.conf` and append the following lines (replace `<version>` with your actual downloaded version number):
   ```conf
   AddJavaLibFile ../lib/flatlaf-<version>.jar
   AddJavaLibFile ../lib/flatlaf-intellij-themes-<version>.jar
   # FlatSolarizedLightIJTheme is recommended, or replace with your preferred theme
   AddVMOption -Dswing.defaultlaf=com.formdev.flatlaf.intellijthemes.FlatSolarizedLightIJTheme
   ```
4. Restart SQL Developer.

> [!WARNING]
> **Potential Visual Glitches & Compatibility Notice**:  
> Injecting a third-party Look & Feel like FlatLaf is an unofficial customization. Because Oracle SQL Developer relies on many legacy and proprietary Swing components, there is a risk of **broken images, missing icons, or layout artifacts** across various dialogs and menus (the full extent of affected views is currently unknown).  
> - If you encounter minor broken icons, restarting SQL Developer may occasionally help reload internal caches.  
> - If you encounter visual glitches that hinder your workflow, you can easily revert to the stock look at any time by removing the three added lines from `sqldeveloper.conf` and restarting.

---

<a name="繁體中文"></a>
## 繁體中文

> 專為 [Oracle SQL Developer](https://www.oracle.com/database/technologies/appdev/sql-developer.html) 設計的復古暖色調 Gruvbox 暗色主題。配色靈感取自經典的 [Gruvbox](https://github.com/morhetz/gruvbox)，專案結構參考 [dracula/oracle-sql-developer](https://github.com/dracula/oracle-sql-developer)。

![預覽截圖](./screenshots/cover.png)

> **字型推薦**：預覽圖採用 [等距更紗黑體 TC (Sarasa Term TC)](https://github.com/be5invis/Sarasa-Gothic)（字型大小：16）。  
> 可於 **工具 (Tools)** > **偏好設定 (Preferences)** > **程式碼編輯器 (Code Editor)** > **字型 (Fonts)** 進行設定。


### 色票對照表

| 語法元素 | Gruvbox Dark (標準) | Gruvbox Soft Dark (柔和) | 說明 |
| :--- | :--- | :--- | :--- |
| **背景 (Background)** | ![](./assets/swatches/282828.svg) `#282828` | ![](./assets/swatches/32302f.svg) `#32302f` | 編輯器底色 |
| **前景文字 (Foreground)** | ![](./assets/swatches/ebdbb2.svg) `#ebdbb2` | ![](./assets/swatches/e0cda5.svg) `#e0cda5` | 一般文字、識別碼 (Identifier) |
| **紅色 (Red)** | ![](./assets/swatches/fb4934.svg) `#fb4934` | ![](./assets/swatches/f3594b.svg) `#f3594b` | 關鍵字 (Keyword)、屬性名稱 |
| **綠色 (Green)** | ![](./assets/swatches/b8bb26.svg) `#b8bb26` | ![](./assets/swatches/b1b946.svg) `#b1b946` | 字串 (String)、新增內容 |
| **黃色 (Yellow)** | ![](./assets/swatches/fabd2f.svg) `#fabd2f` | ![](./assets/swatches/e9b243.svg) `#e9b243` | 元素標籤、常數 (Constant)、標題 |
| **橘色 (Orange)** | ![](./assets/swatches/fe8019.svg) `#fe8019` | ![](./assets/swatches/f38534.svg) `#f38534` | 運算子 (Operator)、括號 (Brace)、分隔符 |
| **紫色 (Purple)** | ![](./assets/swatches/d3869b.svg) `#d3869b` | ![](./assets/swatches/d3869b.svg) `#d3869b` | 數值 (Number)、單位 |
| **灰色 (Gray)** | ![](./assets/swatches/928374.svg) `#928374` | ![](./assets/swatches/928374.svg) `#928374` | 註解 (Comment)、廢棄項目 |
| **深紅 (Dark Red)** | ![](./assets/swatches/cc241d.svg) `#cc241d` | ![](./assets/swatches/cc241d.svg) `#cc241d` | 語法錯誤 (Error)、刪除內容 |
| **選取底色 (Selection)** | ![](./assets/swatches/504945.svg) `#504945` | ![](./assets/swatches/504945.svg) `#504945` | 文字選取區塊、符號高亮底色 |
| **當前行 (Caret Line)** | ![](./assets/swatches/3c3836.svg) `#3c3836` | ![](./assets/swatches/3c3836.svg) `#3c3836` | 游標所在行底色高亮 |

### 安裝步驟

> [!WARNING]
> **開始前請務必完全關閉 Oracle SQL Developer。**
> 若在 SQL Developer 開啟的狀態下修改 `dtcache.xml`，程式關閉時將會自動覆蓋並還原您的修改。

#### 1. 尋找設定檔 `dtcache.xml`

在系統設定資料夾中找到 `dtcache.xml`：

- **Windows 系統**：
  ```text
  %APPDATA%\SQL Developer\system<版本號>\o.ide.<版本號>\dtcache.xml
  ```
  *(範例：`C:\Users\<使用者名稱>\AppData\Roaming\SQL Developer\system23.1.0.097.1607\o.ide.13.0.0.1.42.220309.2132\dtcache.xml`)*

- **macOS 系統**：
  ```text
  ~/.sqldeveloper/system<版本號>/o.ide.<版本號>/dtcache.xml
  ```

- **Linux 系統**：
  ```text
  ~/.sqldeveloper/system<版本號>/o.ide.<版本號>/dtcache.xml
  ```

#### 2. 插入 Gruvbox 主題設定

1. 使用文字編輯器（如 VS Code、Notepad++ 等）開啟 `dtcache.xml`。
2. 搜尋標籤 **`<schemeMap>`**（位於檔案頂部 `<Key>SyntaxSchemes</Key>` 區塊內）。
3. 將 [`Gruvbox-Dark.xml`](./Gruvbox-Dark.xml) 或 [`Gruvbox-Soft-Dark.xml`](./Gruvbox-Soft-Dark.xml) 的完整內容貼入 `<schemeMap>` 與 `</schemeMap>` 標籤之間（可接在現有內建主題的 `</Item>` 之後）：
   ```xml
   <dt-cache class="java.util.HashMap" xmlns="http://xmlns.oracle.com/jdeveloper/110000/dt-cache">
      <Item>
         <Key>SyntaxSchemes</Key>
         <Value class="oracle.ide.ceditor.options.SyntaxSchemes">
            <schemeMap>
               <!-- 現有內建主題 (Classic, Default 等) -->
               <Item>
                  <Key>Classic</Key>
                  ...
               </Item>

               <!-- 在此貼入 Gruvbox 主題的 <Item> 區塊 (亦可兩者皆貼入) -->
               <Item>
                  <Key>Gruvbox Dark</Key>
                  ...
               </Item>
               <Item>
                  <Key>Gruvbox Soft Dark</Key>
                  ...
               </Item>
            </schemeMap>
         </Value>
      </Item>
   </dt-cache>
   ```
4. 儲存並關閉 `dtcache.xml`。

#### 3. 啟用主題

1. 啟動 **Oracle SQL Developer**。
2. 點擊頂端選單 **工具 (Tools)** > **偏好設定 (Preferences)**。
3. 在左側清單展開 **程式碼編輯器 (Code Editor)**，點選 **PL/SQL 語法色彩 (PL/SQL Syntax Colors)**。
4. 在右側的 **配置 (Scheme)** 下拉選單中，選擇 **Gruvbox Dark** 或 **Gruvbox Soft Dark**。
5. 點擊 **確定 (OK)** 即完成套用。

![偏好設定截圖](./screenshots/setting.png)

---

### 疑難排解

- **下拉選單未出現 Gruvbox**：
  - 請確認修改 `dtcache.xml` 前，SQL Developer 是否已確實完全關閉。
  - 檢查 XML 標籤是否完整閉合，且 `<Item>...</Item>` 確實放置於 `<schemeMap>` 之內。
- **存在多個版本目錄**：
  - 若曾升級過 SQL Developer，`%APPDATA%` 或 `~/.sqldeveloper` 中可能存在多個 `system<版本號>` 資料夾，請確認修改的是您目前正在執行的版本目錄。

---

### 進階技巧：應用程式外框 UI 美化 (FlatLaf)

Oracle SQL Developer 預設僅能自訂程式碼編輯區的語法色彩，但若想讓軟體外框（頂端選單、工具列、側邊欄）也擁有現代化的扁平化質感，可透過掛載 **[FlatLaf](https://github.com/JFormDesigner/FlatLaf)** 來達成。

> [!TIP]
> **為什麼推薦外框使用淺色主題？**  
> 在 Oracle SQL Developer 的 Swing 介面中，部分工作表與分頁標籤（Tab）的文字顏色被程式寫死為黑色（`#000000`）。若強制將外框套用全深色 Look & Feel，會導致標籤文字因對比不足而難以閱讀。  
> 實務上推薦搭配淺色現代主題（如 **FlatSolarizedLightIJTheme**），既能享受扁平俐落的外框，又可確保所有分頁標籤清晰可見，並完美襯托暗色的 Gruvbox 編輯區！

#### 設定步驟：

1. 前往 [Maven Central](https://repo1.maven.org/maven2/com/formdev/) 下載 **`flatlaf-<版本號>.jar`** 與 **`flatlaf-intellij-themes-<版本號>.jar`**（建議下載最新穩定版本，例如 `3.7.2` 或更高版本）。
2. 將這兩個 `.jar` 檔案複製到 `<SQL_Developer安裝目錄>\sqldeveloper\lib\` 資料夾內。
3. 用文字編輯器開啟 `<SQL_Developer安裝目錄>\sqldeveloper\bin\sqldeveloper.conf`，於檔案最末端加入以下設定（請將 `<版本號>` 替換為實際下載的檔案名稱）：
   ```conf
   AddJavaLibFile ../lib/flatlaf-<版本號>.jar
   AddJavaLibFile ../lib/flatlaf-intellij-themes-<版本號>.jar
   # 推薦使用 FlatSolarizedLightIJTheme，亦可替換為其他想要的主題
   AddVMOption -Dswing.defaultlaf=com.formdev.flatlaf.intellijthemes.FlatSolarizedLightIJTheme
   ```
4. 儲存並重新啟動 SQL Developer。

> [!WARNING]
> **外觀修改風險與相容性提醒**：  
> 掛載第三方 FlatLaf 屬於非官方的進階美化方式。由於 Oracle SQL Developer 內部包含大量專屬的 Swing 元件，修改後部分視窗、對話框或選單可能存在**破圖、圖示遺失或排版微跑版**的潛在風險（目前尚未完全探明所有可能受影響的實際功能與情境）。  
> - 若遇到圖示抓取異常，有時再次重啟軟體讓快取重新載入即可改善。  
> - 若遇到嚴重視覺異常或不習慣，隨時只需將 `sqldeveloper.conf` 中新增的這三行設定刪除並重啟，即可立刻復原為官方預設外觀。

---

## License

[MIT License](./LICENSE)

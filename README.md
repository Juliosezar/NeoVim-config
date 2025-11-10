---


---

<h1 id="installation-guide">Installation Guide</h1>
<h2 id="installing-nvim">installing Nvim</h2>
<p>in ubuntu is better install nvim with snap or source or … rather than apt-get because we need version 0.8 or higher of nvim to work with Lazy.</p>
<pre><code>sudo add-apt-repository ppa:neovim-ppa/unstable -y && sudo apt install neovim   //for deb\ubuntu
sudo dnf install -y neovim python3-neovim   // for redhat\fedora
</code></pre>
<p>then create <code>/nvim/</code> directory in <code>~/.config/</code>:</p>
<pre><code>mkdir ~/.config/nvim/
cd ~/.config/nvim/
</code></pre>
<p>then clone this repo in that dir:</p>
<pre><code>git clone https://github.com/Juliosezar/NeoVim-config.git .
</code></pre>
<h2 id="installing-dependencies">Installing dependencies</h2>
<p>installing lua and luaRocks &amp; other dependencies:</p>
<pre><code>sudo apt install npm python3.10-venv</code></pre>
<h2 id="download--install-a-nerdfont">Download &amp; install a NerdFont</h2>
<p><a href="https://www.nerdfonts.com/font-downloads">the official website</a><br>
then change your terminal font to nerdfont; for rtl support use ‘konsole’ terminal.</p>
<h2 id="python--rust-requierment">python &amp; rust requierment</h2>
<p>run nvim:<br>
install language server with : <code>:MasonInstall lua-language-server</code><br>
install nodejs for lsp:</p>
<pre><code>curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs
</code></pre>
<p>for installing rust</p>
<h2 id="fixing-django-problems">FIXING DJANGO PROBLEMS</h2>
<p>first activate virtual env and then:</p>
<pre><code>pip install django-stubs
</code></pre>
<p>Add <code>pyrightconfig.json</code> in your project root: (optional)</p>
<pre><code>{
  "typeCheckingMode": "basic",
  "extraPaths": [
    "./.venv/lib/python3.10/site-packages"
  ],
  "reportMissingImports": true,
  "reportUnknownMemberType": false,
  "reportUnknownVariableType": false
}
</code></pre>
<p>Adjust the Python path to match your virtual environment.</p>

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTAwODQ5NDI3NF19
-->
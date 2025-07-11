---


---

<h1 id="installation-guide">Installation Guide</h1>
<h2 id="installing-nvim">installing Nvim</h2>
<pre><code>sudo apt install neovim   //for deb\ubuntu
sudo dnf install neovim   // for redhat\fedora
</code></pre>
<p>then create <code>/nvim/</code> directory in <code>~/.config/</code>:</p>
<pre><code>mkdir ~/.config/nvim/
cd ~/.config/nvim/
</code></pre>
<p>then clone this repo:</p>
<pre><code>git clone git@github.com:Juliosezar/NeoVim-config.git
</code></pre>
<h2 id="installing-dependencies">Installing dependencies</h2>
<h2 id="fixing-django-problems">FIXING DJANGO PROBLEMS</h2>
<p>first activate virtual env and then:</p>
<pre><code>pip install django-stubs
</code></pre>
<p>Add <code>pyrightconfig.json</code> in your project root:</p>
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


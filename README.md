---


---

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


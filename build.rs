#[cfg(windows)]
fn embed_windows_icon() {
    let mut resource = winresource::WindowsResource::new();
    resource
        .set_icon("data/icons/com.github.samfic.szyszka.ico")
        .set("FileDescription", "NeoSzyszka file renamer")
        .set("ProductName", "NeoSzyszka")
        .set("OriginalFilename", "NeoSzyszka.exe")
        .compile()
        .expect("Failed to embed Windows icon resource");
}

#[cfg(not(windows))]
fn embed_windows_icon() {}

fn main() {
    let out_dir = std::env::var("OUT_DIR").unwrap();
    let gresource_xml = std::path::Path::new("data/com.github.samfic.szyszka.gresource.xml");

    let status = std::process::Command::new("glib-compile-resources")
        .args([
            "--sourcedir",
            "data",
            "--target",
            &format!("{out_dir}/com.github.samfic.szyszka.gresource"),
            gresource_xml.to_str().unwrap(),
        ])
        .status()
        .expect("Failed to run glib-compile-resources. Install libglib2.0-dev-bin.");

    assert!(status.success(), "glib-compile-resources failed");

    embed_windows_icon();

    println!("cargo:rerun-if-changed={}", gresource_xml.display());
    println!("cargo:rerun-if-changed=data/icons/com.github.samfic.szyszka.svg");
    println!("cargo:rerun-if-changed=data/icons/com.github.samfic.szyszka.ico");
}

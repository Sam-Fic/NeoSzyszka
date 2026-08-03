use std::path::PathBuf;

use directories_next::ProjectDirs;

pub fn get_cache_path() -> Option<PathBuf> {
    ProjectDirs::from("com", "github.samfic", "NeoSzyszka").map(|p| PathBuf::from(p.cache_dir()))
}

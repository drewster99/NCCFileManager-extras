
import Foundation


public extension FileManager {
    /// The URL of the user's Documents folder (.documentDirectory in .userDomainMask), creating folder is needed.
    var documentsFolder: URL {
        do {
            return try url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        } catch {
            print("\(String(describing: type(of: self))): \(#function): Could not get or create user Documents folder: \(error.localizedDescription)")
            fatalError("Could not get or create user Documents folder: \(error.localizedDescription)")
        }
    }

    /// Returns a full URL given a subfolder name, where the subfolder will be a child of the user's document's directory
    func urlForDocumentsSubfolder(named name: String) -> URL {
        documentsFolder.appendingPathComponent(name, isDirectory: true)
    }

    /// Returns a full URL given a subfolder name, where the subfolder will be a child of the user's document's directory.
    /// The subfolder is created if it doesn't already exists.  Call can throw.
    func urlForDocumentsSubfolder(named name: String, create: Bool) throws -> URL {
        let url = urlForDocumentsSubfolder(named: name)
        if create {
            try createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        }
        return url
    }

    /// Returns a full URL for a file to be located with a named subfolder of the user's documents folder.
    func urlForFileInDocumentsSubfolder(_ filename: String, subfolder: String) -> URL {
        let subfolderUrl = urlForDocumentsSubfolder(named: subfolder)
        return subfolderUrl.appendingPathComponent(filename, isDirectory: false)
    }
}

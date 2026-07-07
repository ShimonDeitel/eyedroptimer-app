import SwiftUI
import StoreKit

struct SettingsView: View {
    @EnvironmentObject var store: Store
    @EnvironmentObject var purchases: PurchaseManager
    @Environment(\.dismiss) var dismiss

    @AppStorage("eyedroptimer.showDates") private var showDates = true
    @AppStorage("eyedroptimer.confirmDelete") private var confirmDelete = true

    var body: some View {
        NavigationStack {
            Form {
                Section("Display") {
                    Toggle("Show dates on list", isOn: $showDates)
                        .accessibilityIdentifier("toggleShowDates")
                    Toggle("Confirm before deleting", isOn: $confirmDelete)
                        .accessibilityIdentifier("toggleConfirmDelete")
                }
                Section("Eye Drop Timer Pro") {
                    if purchases.isPro {
                        Label("Pro Unlocked", systemImage: "checkmark.seal.fill")
                            .foregroundStyle(Theme.accent)
                    } else {
                        Button("Upgrade to Pro") {
                            dismiss()
                        }
                        .accessibilityIdentifier("upgradeButton")
                    }
                    Button("Restore Purchases") {
                        Task { await purchases.restore() }
                    }
                    .accessibilityIdentifier("restoreButton")
                }
                Section("About") {
                    Link("Privacy Policy", destination: URL(string: "https://shimondeitel.github.io/eyedroptimer-app/privacy.html")!)
                    Link("Terms of Use", destination: URL(string: "https://shimondeitel.github.io/eyedroptimer-app/terms.html")!)
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                        .accessibilityIdentifier("settingsDoneButton")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(Store())
        .environmentObject(PurchaseManager())
}

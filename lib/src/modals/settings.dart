import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 1000,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Настройки"),
          const SizedBox(height: 30),
          const Text("Аккаунт"),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.phone_enabled_outlined),
                title: const Text("Смена телефона"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.vpn_key_outlined),
                title: const Text("Смена пароля"),
                onTap: () {},
              ),
            ],
          ),
          const Divider(),
          const Text("Уведомления"),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                title: const Text("Об упоминаниях в обсуждениях"),
                trailing: Switch(
                  value: false,
                  onChanged: (event) {},
                ),
              ),
              ListTile(
                title: const Text("О начале обсуждения"),
                trailing: Switch(
                  value: false,
                  onChanged: (event) {},
                ),
              ),
              ListTile(
                title: const Text("О новых материалах в группах"),
                trailing: Switch(
                  value: false,
                  onChanged: (event) {},
                ),
              ),
            ],
          ),
          const Divider(),
          const Text("Масштаб"),
          Slider(value: 0, onChanged: (event) {}),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bug_report_outlined),
            title: const Text("Обратная связь"),
            onTap: () async {
              await launchUrl(Uri.parse("https://google.com"));
            },
          ),
        ],
      ),
    );
  }
}

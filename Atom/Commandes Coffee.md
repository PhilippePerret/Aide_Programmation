# Commandes coffee récupérées  en lisant les modes d'emploi

* [Écrire un texte au cursor](#ecrire_un_texte_au_cursor)
* [Récupérer la sélection courante](#recuperer_la_selection_courante)
* [Récupérer le contenu du clipboard](#recuperer_le_contenu_du_clipboard)
* [S'en retourner si aucune fenêtre de texte active](#sen_retourner_quand_aucune_fenetre_de_texte_active)
* [Ajouter une commande à atom](#ajouter_une_commande_a_atom)
* [Concatenation de chemins d'accès](#concatenation_de_chemin_dacces)
* [Utilisation de dossier temporaire](#utilisation_du_dossier_temporaire)

<a name='ecrire_un_texte_au_cursor'></a>

## Écrire un texte au cursor

    selection.insertText("<le texte à écrire>")

<a name='recuperer_la_selection_courante'></a>

## Récupérer la sélection courante

    selection = editor.getLastSelection()

<a name='recuperer_le_contenu_du_clipboard'></a>

## Récupérer le contenu du clipboard

    clipboardText = atom.clipboard.read()


<a name='sen_retourner_quand_aucune_fenetre_de_texte_active'></a>

## S'en retourner si aucune fenêtre de texte active

S'en retourner si aucun éditeur de texte (fenêtre) n'est actif

    return unless editor = atom.workspace.getActiveTextEditor()

<a name='ajouter_une_commande_a_atom'></a>

## Ajouter une commande à atom


    atom.commands.add 'atom-text-editor', '<type doc>:<nom commande>' ->
      ... Code de la commande.

<a name='concatenation_de_chemin_dacces'></a>

## Concatenation de chemins d'accès

    full_path = path.join('mon','dossier','fichier')

<a name='utilisation_du_dossier_temporaire'></a>

## Utilisation de dossier temporaire

    os.tmpdir() # rather than /tmp when you need to reference the temporary directory.


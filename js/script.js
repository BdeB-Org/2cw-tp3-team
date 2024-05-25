function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

document.addEventListener('DOMContentLoaded', () => {
    chargerLivres();
    chargerProfil();
    chargerCommandes();
});

const urlLivres = 'http://localhost:3000/livres';
const urlUtilisateurs = 'http://localhost:3000/utilisateurs';
const urlCommandes = 'http://localhost:3000/commandes';

function chargerLivres() {
    const listeLivres = document.getElementById('book-list');
    fetch(urlLivres)
        .then(response => response.json())
        .then(data => {
            data.forEach(livre => {
                let li = createNode('li');
                li.innerHTML = `${livre.titre} par ${livre.auteur} - $${livre.prix}`;
                append(listeLivres, li);
            });
        })
        .catch(error => console.error('Erreur lors du chargement des livres :', error));
}

function chargerProfil() {
    const form = document.getElementById('profile-form');
    if (form) {
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            const formData = new FormData(form);
            const utilisateur = {
                nom_utilisateur: formData.get('nom_utilisateur'),
                email: formData.get('email'),
                mot_de_passe: formData.get('mot_de_passe')
            };
            fetch(urlUtilisateurs, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(utilisateur)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Profil créé avec succès!');
                    form.reset();
                })
                .catch(error => console.error('Erreur lors de la création du profil :', error));
        });
    }
}

function chargerCommandes() {
    const listeCommandes = document.getElementById('order-list');
    fetch(urlCommandes)
        .then(response => response.json())
        .then(data => {
            data.forEach(commande => {
                let li = createNode('li');
                li.innerHTML = `Commande ID: ${commande.id}, Utilisateur ID: ${commande.id_utilisateur}, Date: ${commande.date_commande}`;
                append(listeCommandes, li);
            });
        })
        .catch(error => console.error('Erreur lors du chargement des commandes :', error));
        
        }
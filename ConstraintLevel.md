En SQL, il existe deux niveaux principaux pour définir des contraintes sur une table : les contraintes **au niveau du champ** (ou **colonne**) et les contraintes **au niveau de la table**. Ces deux niveaux permettent de gérer l'intégrité des données de différentes manières, avec des différences subtiles mais importantes.

Voici une explication détaillée de chacun et de leurs différences.

---

## 1. Contrainte au niveau du champ (colonne)

Une **contrainte au niveau du champ** est une contrainte définie directement sur une colonne spécifique lors de la création ou de la modification de la table. Elle affecte uniquement les valeurs de cette colonne.

### Exemple de contraintes au niveau du champ

Voici quelques exemples de contraintes typiques au niveau du champ :

- **NOT NULL** : Empêche les valeurs nulles dans la colonne.
- **UNIQUE** : Garantit que toutes les valeurs dans la colonne sont uniques.
- **CHECK** : Vérifie que chaque valeur dans la colonne respecte une condition spécifiée.
- **DEFAULT** : Définit une valeur par défaut pour la colonne si aucune valeur n'est fournie lors de l'insertion.

### Syntaxe au niveau du champ

Exemple de création de contraintes au niveau du champ pour une colonne `Age` :

```sql
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER CHECK (Age > 18) -- Contrainte CHECK au niveau du champ
);
```

Dans cet exemple :
- La contrainte `CHECK` est appliquée directement sur la colonne `Age`, vérifiant que toutes les valeurs insérées dans cette colonne sont supérieures à 18.

### Limites des contraintes au niveau du champ

Les contraintes au niveau du champ ne peuvent **pas se référer à d'autres colonnes** de la même table. Par exemple, vous ne pouvez pas créer une contrainte `CHECK` au niveau du champ qui compare les valeurs de deux colonnes différentes.

---

## 2. Contrainte au niveau de la table

Une **contrainte au niveau de la table** est définie en dehors des définitions de colonnes individuelles, généralement à la fin de la déclaration de création de table. Cela permet d'appliquer des contraintes plus complexes et d'inclure des contraintes qui impliquent plusieurs colonnes.

### Types de contraintes possibles au niveau de la table

Les contraintes suivantes peuvent être définies au niveau de la table :

- **PRIMARY KEY** : Définit la clé primaire de la table, qui peut inclure une ou plusieurs colonnes.
- **FOREIGN KEY** : Définit une relation entre deux tables en spécifiant une clé étrangère.
- **CHECK** : Contrairement aux contraintes `CHECK` au niveau du champ, une contrainte `CHECK` au niveau de la table peut inclure plusieurs colonnes.

### Syntaxe au niveau de la table

Exemple d'une contrainte `CHECK` qui se réfère à plusieurs colonnes `StartDate` et `EndDate` :

```sql
CREATE TABLE Projects (
    ProjectID NUMBER PRIMARY KEY,
    ProjectName VARCHAR2(50),
    StartDate DATE,
    EndDate DATE,
    CHECK (EndDate > StartDate) -- Contrainte CHECK au niveau de la table
);
```

Dans cet exemple :
- La contrainte `CHECK` est définie au niveau de la table et vérifie que la date de fin (`EndDate`) est toujours postérieure à la date de début (`StartDate`).
- Ce type de contrainte n'est pas possible au niveau du champ, car il nécessite de faire référence à plusieurs colonnes.

### Exemple d'une clé étrangère au niveau de la table

Dans la création d'une relation entre deux tables, une contrainte `FOREIGN KEY` est généralement définie au niveau de la table.

```sql
CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE,
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

Dans cet exemple :
- La contrainte `FOREIGN KEY` `fk_customer` est définie au niveau de la table `Orders` pour établir une relation avec la table `Customers`.

---

## Différences principales entre contraintes au niveau du champ et de la table

| Aspect                     | Contrainte au niveau du champ                      | Contrainte au niveau de la table                        |
|----------------------------|---------------------------------------------------|--------------------------------------------------------|
| **Emplacement**            | Définie directement dans la définition de colonne | Définie à la fin de la déclaration de table            |
| **Usage**                  | Applique des règles simples sur une seule colonne | Applique des règles complexes, potentiellement sur plusieurs colonnes |
| **Références à d'autres colonnes** | Non, ne peut pas se référer à d'autres colonnes de la même table | Oui, peut faire référence à plusieurs colonnes         |
| **Types courants**         | NOT NULL, UNIQUE, CHECK (simple)                   | PRIMARY KEY, FOREIGN KEY, CHECK (complexe)             |

---

### Pourquoi utiliser une contrainte au niveau de la table ?

1. **Relations entre tables** : Les contraintes `FOREIGN KEY` et `PRIMARY KEY` sur plusieurs colonnes doivent être définies au niveau de la table pour établir des relations et garantir l'intégrité référentielle.
2. **Contraintes multi-colonnes** : Lorsque vous devez vérifier une condition qui concerne plusieurs colonnes, une contrainte `CHECK` au niveau de la table est nécessaire.
3. **Clarté et lisibilité** : Parfois, les contraintes définies au niveau de la table rendent le code plus lisible, en regroupant les contraintes de manière cohérente.

### Exemple final illustrant les deux types de contraintes

```sql
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,                -- Contrainte PRIMARY KEY au niveau du champ
    Name VARCHAR2(50) NOT NULL,                   -- Contrainte NOT NULL au niveau du champ
    Age NUMBER CHECK (Age >= 18),                 -- Contrainte CHECK au niveau du champ
    DepartmentID NUMBER,
    StartDate DATE,
    EndDate DATE,
    CONSTRAINT chk_dates CHECK (EndDate > StartDate), -- Contrainte CHECK au niveau de la table
    CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) -- Contrainte FOREIGN KEY au niveau de la table
);
```

Dans cet exemple :

- `EmployeeID` est une contrainte `PRIMARY KEY` au niveau du champ.
- `Age` a une contrainte `CHECK` au niveau du champ pour s'assurer que l'âge est de 18 ans ou plus.
- `chk_dates` est une contrainte `CHECK` au niveau de la table pour vérifier que `EndDate` est après `StartDate`.
- `fk_department` est une contrainte `FOREIGN KEY` au niveau de la table qui relie `DepartmentID` à la table `Departments`.

---

### Conclusion

- Utilisez les **contraintes au niveau du champ** pour les vérifications simples qui concernent une seule colonne.
- Utilisez les **contraintes au niveau de la table** pour les vérifications complexes ou pour établir des relations entre tables.
  
Cela permet de structurer la base de données de manière cohérente tout en assurant l'intégrité des données.
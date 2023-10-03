String handlePrediction(String prediction) {
  String selectedText = "";

  switch (prediction) {
    // apple
    case "Apple Scab":
      selectedText = """
Apple Scab is a fungal disease that affects apple trees. Symptoms include small, olive-green to brown leaf spots that can enlarge and become velvety in texture. The spots may also appear on fruit and twigs. Severe infections can lead to leaf drop and reduced fruit production.
you can control it by:
        1-Remove and destroy infected plant debris 
        to reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled 
        for use on apple trees and for control of 
        scab. Follow all label instructions for 
        proper application and timing.
        3-Plant apple varieties that are resistant 
        to the disease.
        4-Maintain proper tree care and nutrition 
        to promote tree health.
        5-Monitor the tree regularly to detect the 
        disease early.
        6-Use proper pruning techniques to allow 
        for good air circulation within the tree 
        canopy and reduce humidity.
        7-Apply compost or other organic mulch 
        around the tree base to help maintain a 
        moist but well-drained soil.
        8-Avoid overhead irrigation which can 
        increase the humidity.                         
        """;
      break;

    case "Apple Black Rot":
      selectedText = """
Apple Black Rot is a fungal disease that affects apple trees. Symptoms include small, dark brown to black spots on leaves, fruit, and twigs. As the disease progresses, the spots enlarge and can cause the fruit to become distorted and eventually rot. The fungus can also infect the tree's wood, causing cankers that can girdle twigs and branches, leading to dieback.
you can control it by:
        1-Remove and destroy infected plant debris to 
        reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled for 
        use on apple trees and for control of black 
        rot. Follow all label instructions for proper 
        application and timing.
        3-Plant apple varieties that are resistant to 
        the disease.
        4-Maintain proper tree care and nutrition to 
        promote tree health.
        5-Monitor the tree regularly to detect the 
        disease early.
        6-Use proper pruning techniques to remove 
        diseased wood and to open up the tree canopy 
        to improve air circulation.
        7-Apply compost or other organic mulch 
        around the tree base to help maintain 
        a moist but well-drained soil.
        8-Avoid overhead irrigation which can increase 
        the humidity.
        9-Properly thin the fruit to reduce apple 
        overcrowding, which can lead to high humidity 
        within the tree.                         
        """;
      break;

    case "Cedar Apple Rust":
      selectedText = """ 
Cedar Apple Rust is a fungal disease that affects apple trees and cedar trees. The fungus requires both apple and cedar trees to complete its life cycle, and it can cause significant damage to both types of trees. Symptoms on apple trees include yellow or orange spots on leaves and fruit, as well as fruit that is misshapen or distorted. Symptoms on cedar trees include yellow or orange spots or galls on the leaves and branches.
you can control it by:
        1-Remove and destroy infected plant debris to 
        reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled for 
        use on apple trees and for control of cedar 
        apple rust. Follow all label instructions for 
        proper application and timing.
        3-Plant apple varieties that are resistant to 
        the disease.
        4-Remove cedar trees or other juniper species 
        that are within a 1-mile radius of the apple 
        trees.
        5-Monitor the apple trees regularly to detect 
        the disease early.
        6-Use proper pruning techniques to remove 
        diseased wood and to open up the tree canopy 
        to improve air circulation.
        7-Avoid overhead irrigation which can increase 
        the humidity.
        8-Properly thin the fruit to reduce apple 
        overcrowding, which can lead to high humidity 
        within the tree.                        
""";
      break;
    //Corn
    case "Corn Gray Leaf Spot":
      selectedText = """ 
Corn Gray leaf Spot, also known as Gray Leaf Spot, is a fungal disease that affects corn plants. Symptoms include small, circular leaf spots that are grayish-white to tan in color, with a dark purple or brown border. The spots can grow larger and merge together, causing significant leaf damage and reduced crop yields.
you can control it by:
        1-Remove and destroy infected plant 
        debris to reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled 
        for use on corn and for control of 
        Cercospora Leaf Spot. Follow all label 
        instructions for proper application and 
        timing.
        3-Plant corn varieties that are resistant 
        to the disease.
        3-Maintain proper crop rotation, avoiding 
        planting corn in the same field for multiple 
        years in a row.
        4-Provide good drainage and avoid 
        over-watering the plants.
        5-Monitor the crop regularly to detect the 
        disease early.
          """;
      break;
    case "Corn Common Rust":
      selectedText = """ 
Corn Common Rust is a fungal disease that affects corn plants. Symptoms include small, circular pustules on both sides of the leaves, which can turn from yellow to orange to brown as the fungus matures. These pustules can cause leaf damage and can lead to reduced crop yields.
you can control it by:
        1-Remove and destroy infected plant debris 
        to reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled 
        for use on corn and for control of common 
        rust. Follow all label instructions for 
        proper application and timing.
        3-Plant corn varieties that are resistant 
        to the disease.
        4-Maintain proper crop rotation, avoiding 
        planting corn in the same field for multiple 
        years in a row.
        5-Provide good drainage and avoid 
        over-watering the plants.
        6-Monitor the crop regularly to detect the 
        disease early.
            """;
      break;
    case "Corn Northern Leaf Blight":
      selectedText = """ 
Corn Northern Leaf Blight is a fungal disease that affects corn plants. Symptoms include dark, elongated leaf lesions that can be seen on the upper and lower leaf surfaces. The lesions start on the leaf tip and move downward, eventually causing the leaf to die. Severe infections can lead to significant yield loss
you can control it by:
        1-Remove and destroy infected plant debris to 
        reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled for 
        use on corn and for control of Northern Leaf 
        Blight. Follow all label instructions for 
        proper application and timing.
        3-Plant corn varieties that are resistant to 
        the disease.
        4-Maintain proper crop rotation, avoiding 
        planting corn in the same field for multiple 
        years in a row.
        5-Provide good drainage and avoid over
        watering the plants.
        6-Monitor the crop regularly to detect the 
        disease early.
        7-Use proper planting time and avoid planting 
        too early or too late that could increase the 
        risk of the disease.
        8-Avoid planting in low-lying areas that tend 
        to stay wet and humid.                         
""";
      break;
    //Grape
    case "Grape Black Rot":
      selectedText = """ 
Grape Black Rot, also known as Guignardia bidwellii, is a fungal disease that affects grapevines. The symptoms include small, dark lesions on the leaves, fruit, and canes, as well as visible fungal growth on the affected parts. The disease can cause significant yield loss and even death of the grapevine if left untreated.
you can control it by:
        1-Practice crop rotation by not planting 
        grapes or other members of the grape 
        family in the same location for at least 
        three years.
        2-Use disease-resistant varieties of 
        grapes when planting.
        3-Apply a fungicide specifically labeled 
        for use on Grape Black Rot, following the 
        manufacturer's instructions for application 
        rates and timing.
        4-Properly prune the grapevine to remove any 
        infected canes and to promote good air 
        circulation to minimize humidity and reduce 
        the risk of fungal growth.
        5-Keep an eye on the weather, and be prepared 
        to treat the plants if the conditions are 
        favorable for the fungus to spread, such as 
        warm and humid weather.
        6-Keep the vineyard clean, remove and destroy 
        any infected fruit and leaves, as well as any
        plant debris around the infected area.
        7-Avoid planting in low-lying or poorly-drained 
        areas, as the fungus thrives in moist 
        conditions.
        8-Consider applying a protective coating to the 
        grapes at the end of the growing season to 
        protect them from fungal spores.
          """;
      break;

    case "Grape Black Measles":
      selectedText = """ 
Grape Esca, also known as Black Measles, is a fungal disease that affects grapevines. It is caused by a combination of different fungi, including Phaeomoniella chlamydospora, Phaeoacremonium aleophilum and Botryosphaeria species. The symptoms include dark discoloration of the bark and wood, wilting and death of leaves, and eventually death of the grapevine if left untreated.
you can control it by:
        1-Use disease-resistant varieties of grapes 
        when planting.
        2-Properly prune the grapevine to remove 
        any infected canes and to promote good air 
        circulation to minimize humidity and reduce 
        the risk of fungal growth.
        3-Practice crop rotation by not planting 
        grapes or other members of the grape family 
        in the same location for at least three years.
        4-Keep an eye on the weather, and be prepared 
        to treat the plants if the conditions are 
        favorable for the fungus to spread, such as 
        warm and humid weather.
        5-Keep the vineyard clean, remove and destroy 
        any infected fruit and leaves, as well as any 
        plant debris around the infected area.
        6-Avoid planting in low-lying or poorly-drained 
        areas,as the fungus thrives in moistconditions.
        7-Consider applying a fungicide specifically 
        labeled for use on Grape Esca, following the 
        manufacturer's instructions for application 
        rates and timing.
        8-Foliar nutrition, such as micronutrients, can 
        help to strengthen the vine and make it less 
        susceptible to infection.
          """;
      break;
    case "Grape Leaf Blight":
      selectedText = """ 
Grape Leaf Blight, also known as Isariopsis Leaf Spot, is a fungal disease that affects grapevines. Symptoms include small, circular leaf spots that can turn brown or black, and can lead to defoliation and reduced fruit production.
you can control it by:
        1-Remove and destroy infected leaves and 
        canes to reduce the spread of the fungus.
        2-Apply a fungicide specifically labeled 
        for use on grapevines and for control of 
        Isariopsis Leaf Spot. Follow all label 
        instructions for proper application and 
        timing.
        3-Practice good vineyard sanitation, such 
        as removing and destroying any debris or 
        fallen leaves from the vineyard floor to 
        decrease the chance of fungal spores 
        overwintering.
        4-Make sure to monitor your grapevine 
        regularly to detect the disease early.
        5-Consider using a resistant grape variety 
        if possible.
        6-Maintain proper vineyard management and 
        nutrition of the grapevine.
          """;
      break;
    //Rice
    case "Rice Brown Spot":
      selectedText = """ 
Brown spot is a fungal disease that infects the coleoptile, leaves, leaf sheath, panicle branches, glumes, and spikelets.
you can control it by:
        1-monitor soil nutrients regularly.
        2-apply required fertilizers.
        3-for soils that are low in silicon, apply calcium 
        silicate slag before planting.""";
      break;
    case "Rice Downy Mildew":
      selectedText = """ 
Downy mildew is an umbrella term for a large number of plant diseases. It is not a true fungus. They attack vegetables, fruits, and flowers. By the time a plant shows symptoms, it is too late. Prevention is key.
you can stop it by:
        1-promote good air circulation and water early
        in the day to allow leaves to dry thoroughly.
        2-use wide plant spacing to avoid the spread of
        disease.""";
      break;
    case "Rice Bacterial Panicle Blight":
      selectedText = """ 
Bacterial panicle blight is seed-transmitted. The spread of the disease is temperature-dependent.Bacterial panicle blight tends to develop during hot, dry weather at later stages of the plant growth. Prevalence increases when daytime temperatures are above 32°C and night temperatures remain around 25°C or above.
you can control it by:
        1-The quinolone antibiotic oxolinic acid, which 
        is used as a seed treatment and foliar spray, is 
        the only bactericide available to treat bacterial 
        panicle blight preventive measures:
            1-Avoid overwatering.
            2-Monitor the crop regularly and check for 
            sick plants.
            3-Consider crop rotation with non-host 
            crops,like legumes.""";
      break;
    case "Rice Bacterial Leaf Blight":
      selectedText = """ 
Bacterial blight is caused by Xanthomonas oryzae pv. oryzae.It causes wilting of seedlings and yellowing and drying of leaves.
you can control it by:
        1-Planting resistant varieties has been proven 
        to be the most efficient, most reliable, and 
        cheapest way to control bacterial blight.
        2-Use balanced amounts of plant nutrients,
        especially nitrogen.
        3-Ensure good drainage of fields (in 
        conventionally flooded crops) and 
        nurseries.""";
      break;
    case "Rice Bacterial Leaf Streak":
      selectedText = """ 
Bacterial leaf streak is caused by the bacterium Xanthomonas vasicola. The disease has been observed on field corn, seed corn, popcorn, and sweet corn.
you can control it by:
        1-Plant resistant varieties.
        2-treat seeds with hot water.
        3-Use balanced amounts of plant nutrients,
        especially nitrogen.
        4-Drain the field during severe flood.""";
      break;
    case "Rice Tungro":
      selectedText = """ 
Rice tungro disease is caused by the combination of two viruses, which are transmitted by leafhoppers. It causes leaf discoloration, stunted growth, reduced tiller numbers and		sterile or partly filled grains.
you can control it by:
        1-Plow infected stubbles immediately after 
        harvest to reduce inoculum sources and
        destroy the eggs and breeding sites of green
        leaf hopper.
        2-Adjust planting times to when green 
        leafhopper are not in season or abundant,
        if known.
        3-Practice synchronous planting with 
        surrounding farms.""";
      break;
    case "Rice Dead Heart":
      selectedText = """ 
Caterpillar bore into central shoot of paddy seedling and tiller, causes drying of the central shoot known as “dead heart”.
you can control it by:
        1-Use resistant varieties.
        2-At seedbed and transplanting, handpick and
        destroy egg masses.
        3-Raise level of irrigation water periodically
        to submerge the eggs deposited on the lower 
        parts of the plant.
        4-Before transplanting, cut the leaf-top
        to reduce carry-over of eggs from the seedbed 
        to the field.""";
      break;
    case "Rice Hispa":
      selectedText = """ 
Rice hispa is a very serious insect pest of rice, particularly in the Terai region of Nepal. The adult is a small bluish black 	beetle, measuring 5 mm in length and is recognized by numerous short spines on the body and forewings.
you can control it by:
        1- Spraying of methyl parathion 0.05% or 
        Quinalphos 0.05%.
        2-Avoid over fertilizing the field.
        3-To prevent egg laying of the pests, the shoot 
        tips can be cut.""";
      break;
    case "Rice Blast":
      selectedText = """ 
Blast disease, also known as rice rotten neck, is caused by the fungus Pyricularia oryzae and is the most damaging of all the 	fungal diseases in Southern Africa.
you can control it by:
        1-Incorporate or roll the rice stubble soon after
        harvest to promote early decomposition.
        2-Use fungicides.""";
      break;

    //Potato
    case "Potato Early Blight":
      selectedText = """ 
Potato Early Blight, also known as Alternaria solani, is a fungal disease that affects potato plants. The symptoms include dark, circular lesions on the leaves, stem, and tubers of the plant. The disease can cause significant yield loss if left untreated.
you can control it by:
        1-Remove and dispose of all infected plants,
        as well as any plant debris around the 
        infected area.
        2-Practice crop rotation by not planting 
        potatoes or other members of the nightshade 
        family (tomatoes, peppers, eggplants) in the 
        same location for at least two years.
        3-Use disease-resistant varieties of potatoes 
        when planting.
        4-Apply a fungicide specifically labeled for 
        use on Potato Early Blight, following the 
        manufacturer's instructions for application 
        rates and timing.
        5-Properly water the plants, avoid overhead 
        watering as it can lead to spread of the 
        disease.
        6-Properly space the plants to ensure good 
        air circulation to minimize humidity and 
        reduce the risk of fungal growth.
        7-Keep an eye on the weather, and be prepared 
        to treat the plants if the conditions are 
        favorable for the fungus to spread.
""";
      break;
    case "Potato Late Blight":
      selectedText = """ 
Potato Late Blight, also known as Phytophthora infestans, is a serious fungal disease that affects potato plants. The symptoms include large, irregularly-shaped, water-soaked lesions on the leaves, stem, and tubers of the plant. The disease can cause significant yield loss and even total crop failure if left untreated.
you can control it by:
        1-Purchase seed potatoes that have been 
        certified as disease-free, as the fungus 
        can survive on tubers and infect the 
        next crop.
        2-Practice crop rotation by not planting 
        potatoes or other members of the 
        nightshade family (tomatoes, peppers, 
        eggplants) in the same location for 
        at least three years.
        3-Use disease-resistant varieties of 
        potatoes when planting.
        4-Apply a fungicide specifically 
        labeled for use on Potato Late Blight, 
        following the manufacturer's 
        instructions for application rates and 
        timing.
        5-Properly water the plants, avoid overhead 
        watering as it can lead to spread of the 
        disease.
        6-Properly space the plants to ensure good 
        air circulation to minimize humidity and 
        reduce the risk of fungal growth.
        7-Keep an eye on the weather, and be prepared 
        to treat the plants if the conditions are 
        favorable for the fungus to spread, such as 
        warm and humid weather.
        8-Avoid planting in low-lying or 
        poorly-drained areas, as the fungus thrives 
        in moist conditions.
          """;
      break;
    //Tomato
    case "Tomato Bacterial Spot":
      selectedText = """ 
Tomato Bacterial Spot is a disease caused by the bacteria Xanthomonas campestris. It can cause leaf spots, stem cankers, and fruit rot on tomato plants. Symptoms include small,circular, water-soaked spots that may turn yellow and develop a reddish-brown border.In severe cases, the leaves may wilt and the plant may die.
you can control it by:
        1-Using disease-free seed or transplants
        2-Rotating crops to avoid planting tomatoes in
        the same location for several years.
        3-Removing and destroying infected plants
        4-Using drip irrigation to avoid wetting the 
        foliage.
        5-Applying copper-based fungicides or 
        bactericides.
        6-Avoiding overhead irrigation and pruning lower 
        leaves to improve air circulation.
        7-Using resistant varieties when available.
          """;
      break;
    case "Tomato Early Blight":
      selectedText = """ 
Tomato Early Blight is a fungal disease caused by Alternaria solani. It can affect both leaves and fruit of tomato plants and is characterized by dark, circular spots on leaves and fruit, and dark, sunken areas on stems. Symptoms often appear first on lower leaves and can spread to the entire plant if left untreated.
you can control it by:
        1-Using disease-free seed or transplants.
        2-Rotating crops to avoid planting tomatoes in 
        the same location for several years.
        3-Maintaining proper spacing between plants to 
        improve air circulation.
        4-Watering at the base of the plant to avoid
        wetting the foliage.
        5-Applying a fungicide specifically labeled for 
        early blight control.
        6-Cleaning up and removing any infected plant 
        debris.
        7-Using resistant varieties when available.
          """;
      break;
    case "Tomato Late Blight":
      selectedText = """ 
Tomato Late Blight is a fungal disease caused by Phytophthora infestans. It can affect both leaves and fruit of tomato and potato plants and is characterized by large, irregularly shaped, dark-brown to black spots on leaves, stems, and fruit. The leaves may also turn yellow and wilt. In severe cases, the entire plant can be killed. Late blight is particularly destructive because it can spread rapidly in warm and humid weather, and the spores can be carried long distances by wind.
you can control it by:
        1-Using disease-free seed or transplants.
        2-Rotating crops to avoid planting tomatoes
        and potatoes in the same location for several 
        years.
        3-Maintaining proper spacing between plants to 
        improve air circulation.
        4-Watering at the base of the plant to avoid 
        wetting the foliage.
        5-Applying a fungicide specifically labeled for 
        late blight control.
        6-Cleaning up and removing any infected plant 
        debris.
        7-Using resistant varieties when available.
          """;
      break;
    case "Tomato Leaf Mold":
      selectedText = """ 
Tomato leaf mold is a fungal disease that affects tomato plants and caused by the fungus Fulvia fulva. It's commonly found in humid and warm growing conditions. The fungus can cause small, brown, circular spots on the leaves that can enlarge and merge, causing the leaves to turn yellow and eventually die. The fungus can also affect the fruit, causing it to rot and become unmarketable.
you can control it by:
        1-Practice good cultural control measures such 
        as proper spacing between plants, adequate air 
        circulation, and avoiding overhead irrigation.
        2-Keep the leaves dry by avoiding overhead 
        irrigation, and keeping the leaves dry during the 
        morning hours.
        3-Fungicides can be used to prevent or treat the 
        fungus. You can use a fungicide that contains 
        copper, such as copper hydroxide or copper 
        sulfate.
        4-Remove and destroy any infected leaves, fruits 
        and plant debris to avoid spores to spread.
        5-Rotate your crop every year, so that the fungus 
        does not have an opportunity to build up in the 
        soil.
        6-Lastly, a good sanitation habit is key to keep 
        the fungus from spreading.
          """;
      break;
    case "Tomato Septoria Leaf Spot":
      selectedText = """ 
Tomato septoria leaf spot is a fungal disease caused by the organism Septoria lycopersici. It is common in tomato plants, particularly during wet and cool weather conditions. Symptoms of tomato septoria leaf spot include the appearance of small, dark brown to black spots on the leaves, which are surrounded by a yellow halo. As the disease progresses, the spots can merge, causing entire leaves to turn yellow and die. The fungus can also infect the stem and fruit, but this is less common.
you can control it by:
        1-Plant disease-resistant tomato varieties.
        2-Avoid planting tomatoes in areas where 
        septoria leaf spot has been a problem in the 
        past.
        3-Avoid overhead irrigation, which can spread 
        the spores of the fungus.
        4-Remove and destroy any infected leaves,
        fruits and plant debris to avoid spores 
        to spread.
        5-Use fungicides that contain chlorothalonil or 
        mancozeb to protect the plant from infection.
        6-Rotate your crop every year, so that the 
        fungus does not have an opportunity to build up
        in the soil.
        7-Lastly, a good sanitation habit is key to keep 
        the fungus from spreading.
          """;
      break;
    case "Tomato Spider Mites":
      selectedText = """ 
The Two-Spotted Spider Mite (Tetranychus urticae) is a common pest of tomato plants. These tiny mites feed on the foliage of the plant, causing yellow stippling on the leaves and eventual leaf loss.
you can control it by:
        1-Using a strong spray of water to physically 
        remove the mites from the plants
        2-Applying neem oil, insecticidal soap, or 
        horticultural oil to the plants, which will 
        suffocate the mites
        3-Using a pesticide specifically labeled for 
        use against spider mites, such as bifenthrin 
        or acaricides
        4-Introducing beneficial insects such as 
        ladybugs, lacewings or predatory mites which 
        feed on spider mites
          """;
      break;
    case "Tomato Target Spot":
      selectedText = """ 
Tomato Target Spot is a fungal disease caused by the fungus Corynespora cassiicola. It is characterized by small, circular, dark brown to black spots on the leaves, stems, and fruit of tomato plants. These spots can grow and merge together, eventually causing the affected leaves to yellow and fall off. The disease is more common in warm, humid weather and can spread rapidly through the crop if left untreated.
you can control it by:
        1-Rotate crops to avoid planting tomatoes in the 
        same location year after year.
        2-Plant disease-resistant tomato varieties
        3-Keep the tomato plants well-watered and 
        maintain good air circulation around the plants.
        4-Avoid overhead watering and try to water the 
        ground directly to reduce the amount of 
        humidity around the plants.
        5-Remove and destroy any infected plant parts.
        6-Apply a fungicide labeled for use against 
        Tomato Target Spot, following the label 
        instructions for safe and effective use.
          """;
      break;
    case "Tomato Mosaic Virus":
      selectedText = """ 
Tomato mosaic virus (ToMV) is a plant virus that affects tomato plants. Symptoms of infection include leaf mottling and distortion, as well as fruit discoloration and deformities. The virus is spread by aphids and can also be transmitted through contaminated seed or tools.
you can control it by:
        1-There is no cure for ToMV once a plant is 
        infected. The best way to prevent the spread 
        of the virus is to practice good garden hygiene,
        such as removing and destroying infected 
        plants,using insecticides to control aphid 
        populations,and avoiding using contaminated 
        seed or transplants.
        2-Crop rotation is also a good practice to avoid
        the re-occurrence of the virus in the next season. 
        Also, you should use resistant varieties of 
        tomatoes, as some varieties are more resistant 
        to ToMV.
        3-In case of severe infection, it's better to 
        remove the infected plants from the garden to 
        avoid spreading the virus to the healthy plants.
            """;
      break;

    case "Tomato Yellow Leaf Curl Virus":
      selectedText = """ 
Tomato Yellow Leaf Curl Virus (TYLCV) is a plant virus that affects tomato plants and is transmitted by the whitefly vector. The symptoms of TYLCV include yellowing and curling of leaves, reduced growth, and fruit production. The leaves may also become thickened and the leaf edges may roll inward. In severe cases, the entire plant can become stunted, and there may be a significant reduction in yield.
you can control it by:
        1-Use whitefly-resistant tomato varieties
        2-Monitor whitefly populations and take action 
        to reduce them if they become high
        3-Use physical barriers such as row covers or 
        sticky traps to prevent whiteflies from reaching 
        the plants
        4-Use a systemic insecticide to protect the 
        plant from whitefly.
        5-Remove and destroy infected plants and 
        surrounding plants nearby to avoid the spread 
        of the virus.
          """;
      break;
              //cotton
    case "Cotton Aphids":
      selectedText = """ 
Cotton aphids are small insects that infest cotton plants and feed on their sap. They are common pests in cotton farming and can cause significant damage to the crop if left unchecked.
To control cotton aphids, here are some methods:
        1-Encourage natural predators such as ladybugs,
        lacewings, and parasitic wasps that feed on 
        aphids. They can help keep the aphid population 
        in check.
        2-Insecticides specifically designed for aphid 
        control can be used. Consult with agricultural 
        experts or follow recommended guidelines for 
        appropriate and safe pesticide application.
        3-Implement good agricultural practices such as 
        crop rotation, proper irrigation, and adequate 
        plant nutrition to promote healthy cotton plants that 
        are more resistant to aphid infestations.
        4-In cases of localized aphid populations, physically 
        removing the affected plant parts or using water 
        sprays can help reduce their numbers.
          """;
      break;
          case "Cotton Army Worm":
      selectedText = """ 
Cotton armyworm, also known as cotton bollworm, is a common pest that affects cotton crops. It is the larval stage of a moth species and can cause significant damage to cotton plants by feeding on various plant parts, including leaves, flowers, and bolls.
Here are some control measures for cotton armyworm:
        1-Regularly inspect cotton fields for signs of 
        armyworm infestation, such as chewed leaves or 
        larvae presence.Early detection is crucial for 
        effective control.
        2-Encourage natural enemies of armyworms, such as 
        parasitic wasps, ladybugs, and spiders, by preserving 
        natural habitats and minimizing the use of 
        broad-spectrum insecticides that can harm beneficial 
        insects.
        3-If the infestation reaches economic thresholds, 
        insecticides labeled for armyworm control can be 
        applied.Follow recommended guidelines and consult 
        with agricultural experts to ensure proper application 
        and minimize environmental impact.
        4-Implement cultural practices like crop rotation, weed 
        control, and timely planting to disrupt the armyworm 
        life cycle and reduce their populations.
        5-Adopt an integrated approach that combines 
        multiple control strategies, including cultural 
        practices, biological control, and judicious use of 
        insecticides, to manage armyworm infestations 
        effectively.
          """;
      break;
          case "Cotton Bacterial Blight":
      selectedText = """ 
Cotton bacterial blight is a devastating disease caused by the bacterium Xanthomonas citri subsp. malvacearum. It affects cotton plants and can lead to significant yield losses if not properly managed. 
Here's a overview of cotton bacterial blight and its control measures:
        Symptoms: Infected cotton plants exhibit water-
        soaked lesions on leaves, stems, and bolls, which 
        eventually turn brown and necrotic. The disease may 
        cause premature defoliation and boll rot, leading 
        to reduced cotton quality and yield.
        Prevention: Start with disease-free planting material 
        and avoid introducing infected plants into the field. 
        Crop rotation with non-host crops and maintaining 
        proper plant spacing can help reduce disease 
        incidence.
        Resistant Varieties: Planting cotton varieties that have 
        been bred for resistance to bacterial blight is an 
        effective control strategy. These varieties have genetic 
        traits that make them less susceptible to the disease.
        Sanitation: Remove and destroy infected plant debris 
        from the field after harvest to prevent the bacteria 
        from surviving in crop residues. Also, clean and 
        disinfect equipment used in infected fields to prevent 
        the spread of the pathogen.
        Copper-based Sprays: Copper-based bactericides can 
        be used as a preventive measure or in combination
        with resistant varieties to manage bacterial blight. 
        Follow recommended application rates and timing to 
        maximize effectiveness.
        Avoid Overhead Irrigation: Minimize overhead 
        irrigation, as it can create conditions conducive 
        to bacterial blight development by promoting the 
        spread of bacteria through water droplets.
          """;
      break;
          case "Cotton Powdery Mildew":
      selectedText = """ 
Cotton powdery mildew is a fungal disease caused by the pathogen, usually classified as either Erysiphe gossypii or Golovinomyces gossypii. It affects cotton plants and can lead to reduced growth, yield losses, and quality deterioration. 
Here's overview of cotton powdery mildew and its control measures:
        Symptoms: Infected cotton plants develop a powdery 
        white or grayish coating on the leaves, stems, and 
        other plant parts. This coating consists of fungal 
        spores and mycelium. Infected leaves may also show 
        curling, distortion, and premature defoliation.
        Prevention: Start with disease-free planting material,
        as infected seeds can be a source of infection. Ensure 
        proper plant spacing and adequate air circulation to 
        reduce humidity levels, as high humidity favors 
        powdery mildew development.
        Resistant Varieties: Planting cotton varieties that have 
        been bred for resistance to powdery mildew can be an 
        effective control strategy. These varieties have genetic 
        traits that make them less susceptible to the disease.
        Cultural Control: Proper crop management practices 
        can help reduce disease incidence. This includes 
        timely planting, appropriate fertilization, and pruning 
        to improve air circulation and reduce humidity.
        Fungicides: In severe cases or when resistant varieties 
        are not available, fungicides labeled for powdery 
        mildew control can be used. Follow recommended 
        application rates and timing, and rotate between 
        different fungicide classes to minimize the 
        development of resistance.
        Sanitation: Remove and destroy infected plant debris 
        from the field after harvest to reduce the chances of 
        overwintering fungal structures.
        Monitoring: Regularly scout the field for early signs of 
        powdery mildew infection. Early detection allows for 
        timely intervention and better disease management.
          """;
      break;
          case "Cotton Target Spot":
      selectedText = """ 
Cotton target spot, also known as Corynespora leaf spot, is a fungal disease caused by the pathogen Corynespora cassiicola. It affects cotton plants and can cause significant damage to leaves, stems, and bolls, leading to yield losses and reduced fiber quality. 
Here's a overview of cotton target spot and its control measures:
        Symptoms: Infected cotton plants develop small,
        circular to irregular spots on leaves, which 
        may expand and merge over time. The spots have a 
        characteristic target-like appearance with concentric 
        rings of different colors. Severe infections can 
        cause defoliation and premature boll opening.
        Prevention: Start with disease-free planting material,
        as infected seeds can be a source of infection. 
        Implement crop rotation with non-host crops to reduce 
        the buildup of the pathogen in the soil.
        Cultural Control: Optimize plant spacing and promote 
        good air circulation within the field to reduce 
        humidity levels and create an unfavorable environment 
        for target spot development. Avoid excessive nitrogen 
        fertilization, as it can increase susceptibility to 
        the disease.
        Fungicides: When target spot reaches damaging levels,
        fungicides labeled for target spot control can be 
        applied. Follow recommended application rates and 
        timing, and consider incorporating different fungicide 
        classes to minimize the development of resistance.
        Sanitation: Remove and destroy infected plant debris 
        from the field after harvest to reduce the overwintering 
        of the pathogen.
        Monitoring: Regularly monitor the field for early signs 
        of target spot infection. Early detection allows for 
        timely intervention and better disease management.  
          """;
      break;
  }
  return selectedText;
}
